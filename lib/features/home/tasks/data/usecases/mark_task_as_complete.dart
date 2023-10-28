import 'package:dartz/dartz.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/app/app_usecase.dart';

class MarkTaskAsComplete implements Usecase<VoidType, MarkTaskAsCompleteParam> {
  final TasksRepository _tasksRepository;

  MarkTaskAsComplete(this._tasksRepository);

  Future<Either<UIError, VoidType>> call(MarkTaskAsCompleteParam param) async {
    try {
      await _tasksRepository.markTaskAsComplete(
        categoryTitle: param.categoryTitle,
        taskTitle: param.taskTitle,
      );
      return const Right(VoidType());
    } on NetworkFailure catch (e) {
      return Left(UIError(e.message));
    }
  }
}

class MarkTaskAsCompleteParam {
  final String categoryTitle;
  final String taskTitle;


  MarkTaskAsCompleteParam({
    required this.categoryTitle,
    required this.taskTitle,
  });
}
