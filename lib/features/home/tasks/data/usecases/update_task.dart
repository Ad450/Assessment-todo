import 'package:dartz/dartz.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class UpdateTask implements Usecase<VoidType, UpdateTaskParam> {
  final TasksRepository _tasksRepository;

  UpdateTask(this._tasksRepository);

  Future<Either<UIError, VoidType>> call(UpdateTaskParam param) async {
    try {
      await _tasksRepository.updateTask(
        categoryTitle: param.categoryTitle,
        oldTaskTitle: param.oldTitle,
        update: param.update,
      );
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class UpdateTaskParam {
  final String oldTitle;
  final String categoryTitle;
  final String update;

  UpdateTaskParam({
    required this.categoryTitle,
    required this.oldTitle,
    required this.update,
  });
}
