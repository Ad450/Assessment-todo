import 'package:dartz/dartz.dart';
import 'app_errors.dart';

/// An Interface that must be implemented by all usecases
/// All subclasses will be callable like functions through
/// the implemented [call] method
abstract class Usecase<R, P> {
  Future<Either<UIError, R>> call(P param);
}

/// VoidType is the returned object for a usecase call
/// that returns void
class VoidType {
  const VoidType();
}

/// NoParam is the parameter of a usecase call that
/// that accepts no argument
class NoParam {
  const NoParam();
}

///[guardedApiCall] t wraps an API call to handle
/// exceptions of type DbFailure.
/// If the API call fails with an ApiFailure,
///it rethrows the exception as a ApiFailure

Future<T> guardedApiCall<T>(Function func) async {
  try {
    return await func() as T;
  } on DbFailure catch (e) {
    throw ApiFailure(e.message);
  }
}
