import 'package:dartz/dartz.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class AddTasks implements Usecase<VoidType, AddTaskParam> {
  final TasksRepository _tasksRepository;

  AddTasks(this._tasksRepository);

  Future<Either<UIError, VoidType>> call(AddTaskParam param) async {
    try {
      await _tasksRepository.addTasks(
        categoryTitle: param.categoryTitle,
        taskTitle: param.taskTitle,
        description: param.description,
      );
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class AddTaskParam {
  final String categoryTitle;
  final String taskTitle;
  final String? description;

  AddTaskParam({
    required this.categoryTitle,
    required this.description,
    required this.taskTitle,
  });
}
