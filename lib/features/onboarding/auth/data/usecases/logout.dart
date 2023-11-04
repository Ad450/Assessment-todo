import 'package:dartz/dartz.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';
import '../repository/auth_repository.dart';

class Logout implements Usecase<VoidType, NoParam> {
  final AuthRepository _authRepository;

  Logout(this._authRepository);
  Future<Either<UIError, VoidType>> call(NoParam param) async {
    try {
      await _authRepository.logout();
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
