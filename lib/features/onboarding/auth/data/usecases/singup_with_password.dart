import 'package:dartz/dartz.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class SignupWithEmailAndPassword implements Usecase<VoidType, SignupWithEmailAndPasswordParam> {
  final AuthRepository _authRepository;

  SignupWithEmailAndPassword(this._authRepository);

  Future<Either<UIError, VoidType>> call(SignupWithEmailAndPasswordParam param) async {
    try {
      await _authRepository.signupWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class SignupWithEmailAndPasswordParam {
  final String email;
  final String password;
  SignupWithEmailAndPasswordParam({
    required this.email,
    required this.password,
  });
}
