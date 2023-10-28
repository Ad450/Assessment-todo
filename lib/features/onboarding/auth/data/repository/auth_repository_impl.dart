import 'package:todo/core/app/app_usecase.dart';
import 'package:todo/features/home/tasks/data/datasources/local_datasource.dart';
import 'package:todo/features/onboarding/auth/data/datasources/local_datasource.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;
  AuthRepositoryImpl(this.authLocalDatasource);

  @override
  Future<String?> getCachedUser() async => await guardedApiCall(
        () => authLocalDatasource.getCachedUser(),
      );

  @override
  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await guardedApiCall(
        () => authLocalDatasource.signupWithEmailAndPassword(email: email, password: password),
      );

  @override
  Future<void> signupWithGoogle() async => await guardedApiCall(
        () => authLocalDatasource.signupWithGoogle(),
      );
}
