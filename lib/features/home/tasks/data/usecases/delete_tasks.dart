import 'package:dartz/dartz.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class DeleteTask implements Usecase<VoidType, DeleteTaskParam> {
  final TasksRepository _tasksRepository;

  DeleteTask(this._tasksRepository);

  Future<Either<UIError, VoidType>> call(DeleteTaskParam param) async {
    try {
      await _tasksRepository.deleteTasks(
        taskTitle: param.taskTitle,
        categoryTitle: param.categoryTitle,
      );
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class DeleteTaskParam {
  final String categoryTitle;
  final String taskTitle;

  DeleteTaskParam({required this.categoryTitle, required this.taskTitle});
}
