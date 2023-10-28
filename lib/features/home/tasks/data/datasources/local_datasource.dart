import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/models/category_model.dart';
import 'package:todo/core/storage/hive.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/models/task_model.dart';

abstract class LocalDatasource {
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  });
  Future<void> deleteTasks({required String categoryTitle, required String taskTitle});
  Future<List<CategoryModel>> fetchAllTasks();
  Future<void> updateTask({required String categoryTitle, required String oldTaskTitle, required String update});
  Future<void> markTaskAsComplete({required String categoryTitle, required String taskTitle,}); 
}

class LocalDatasourceImpl implements LocalDatasource {
  final HiveService hiveService;

  LocalDatasourceImpl(this.hiveService);
  @override
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user?.uid == null) {
        throw ApiFailure("No user found");
      }
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory != null) {
        final updatedCategory = existingCategory.tasks.add(TaskModel(uid: user!.uid, title: taskTitle));
        await hiveService.saveItem(updatedCategory, HiveBoxNames.categories.name, key: key);
      } else {
        await hiveService.saveItem(
          CategoryModel(uid: user!.uid, title: categoryTitle, tasks: <TaskModel>[
            TaskModel(
              title: taskTitle,
              uid: user.uid,
              description: description,
            )
          ]),
          HiveBoxNames.categories.name,
        );
      }
      return;
    } on ApiFailure catch (_) {
      rethrow;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> deleteTasks({required String categoryTitle, required String taskTitle}) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      existingCategory.tasks.removeWhere((e) => e.title == taskTitle);
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name, key: key);
      return;
    } catch (e) {}
  }

  @override
  Future<List<CategoryModel>> fetchAllTasks() async {
    try {
      final categories = await hiveService.readAll(HiveBoxNames.categories.name);
      return categories as List<CategoryModel>;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> updateTask({
    required String categoryTitle,
    required String oldTaskTitle,
    required String update,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user?.uid == null) {
        throw ApiFailure("No user found");
      }
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      final taskIndex = existingCategory.tasks.indexWhere((e) => e.title == oldTaskTitle);
      if (taskIndex >= 0) {
        existingCategory.tasks[taskIndex] = TaskModel(uid: user!.uid, title: update);
      } else {
        throw ApiFailure("Task not found");
      }
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name, key: key);
      return;
    } on ApiFailure catch (_) {
      rethrow;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
   Future<void> markTaskAsComplete({required String categoryTitle, required String taskTitle,})async {
    try { 

    } catch (e){

    }
   }
}
