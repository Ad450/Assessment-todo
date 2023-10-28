import 'package:dartz/dartz.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class CheckAuthStatus implements Usecase<String?, NoParam> {
  final AuthRepository _authRepository;

  CheckAuthStatus(this._authRepository);

  Future<Either<UIError, String?>> call(NoParam param) async {
    try {
      final result = await _authRepository.getCachedUser();
      return Right(result);
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
