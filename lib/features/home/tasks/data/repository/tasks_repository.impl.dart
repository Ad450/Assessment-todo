import 'package:todo/core/app/app_usecase.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';

import '../../../../../core/models/category_model.dart';
import '../datasources/tasks_local_datasource.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksLocalDatasource localDatasource;

  TasksRepositoryImpl(this.localDatasource);

  @override
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  }) async =>
      await guardedApiCall(
        () => localDatasource.addTasks(
          categoryTitle: categoryTitle,
          taskTitle: taskTitle,
          description: description,
        ),
      );

  @override
  Future<void> deleteTasks({
    required String categoryTitle,
    required String taskTitle,
  }) async =>
      await guardedApiCall(
        () => localDatasource.deleteTasks(
          taskTitle: taskTitle,
          categoryTitle: categoryTitle,
        ),
      );

  @override
  Future<List<dynamic>> fetchAllTasks() async => await guardedApiCall(() => localDatasource.fetchAllTasks());

  @override
  Future<void> updateTask({
    required String categoryTitle,
    required String oldTaskTitle,
    required String update,
  }) async =>
      await guardedApiCall(
        () => localDatasource.updateTask(
          oldTaskTitle: oldTaskTitle,
          update: update,
          categoryTitle: categoryTitle,
        ),
      );

  @override
  Future<void> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  }) async =>
      await guardedApiCall(
        () => localDatasource.markTaskAsComplete(
          taskTitle: taskTitle,
          categoryTitle: categoryTitle,
        ),
      );
}
