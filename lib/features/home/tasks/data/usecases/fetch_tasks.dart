import 'package:dartz/dartz.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class FetchAllTasks implements Usecase<List<dynamic>, NoParam> {
  final TasksRepository _tasksRepository;

  FetchAllTasks(this._tasksRepository);

  Future<Either<UIError, List<dynamic>>> call(NoParam param) async {
    try {
      final result = await _tasksRepository.fetchAllTasks();
      return Right(result);
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}
