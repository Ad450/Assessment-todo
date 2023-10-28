import '../../../../../core/models/category_model.dart';

abstract class TasksRepository {
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  });
  Future<void> deleteTasks({required String categoryTitle, required String taskTitle});
  Future<List<CategoryModel>> fetchAllTasks();
  Future<void> updateTask({required String categoryTitle, required String oldTaskTitle, required String update});
  Future<void> markTaskAsComplete({required String categoryTitle, required String taskTitle});
}
