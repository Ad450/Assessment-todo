import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class Logout implements Usecase<VoidType, NoParam> {
  Future<Either<UIError, VoidType>> call(NoParam param) async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
