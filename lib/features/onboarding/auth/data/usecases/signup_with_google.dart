import 'package:dartz/dartz.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class SignupWithGoogle implements Usecase<VoidType, NoParam> {
  final AuthRepository _authRepository;

  SignupWithGoogle(this._authRepository);

  Future<Either<UIError, VoidType>> call(NoParam param) async {
    try {
      await _authRepository.signupWithGoogle();
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
