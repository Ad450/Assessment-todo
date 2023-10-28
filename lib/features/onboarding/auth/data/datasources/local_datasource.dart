import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo/core/app/app_errors.dart';

import '../../../../../core/storage/hive.dart';

abstract class AuthLocalDatasource {
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signupWithGoogle();
  Future<String?> getCachedUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final HiveService hiveService;

  AuthLocalDatasourceImpl(this.hiveService);
  @override
  Future<void> signupWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await hiveService.saveItem(
        credential.user?.uid,
        HiveBoxNames.users.name,
        key: credential.user?.uid,
      );
      return;
    } on FirebaseAuthException catch (e) {
      throw ApiFailure(e.code);
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> signupWithGoogle() async {
    try {
      final userExits = await getCachedUser();
      if (userExits != null) {
        return;
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        final googleCredentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final userCredentials = await FirebaseAuth.instance.signInWithCredential(googleCredentials);
        await hiveService.saveItem(
          userCredentials.user?.uid,
          HiveBoxNames.users.name,
          key: userCredentials.user?.uid,
        );
        return;
      }
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<String?> getCachedUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user?.uid != null) {
        throw ApiFailure("user not found");
      }
      final uid = await hiveService.readItem(user!.uid, HiveBoxNames.users.name);
      return uid;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }
}
