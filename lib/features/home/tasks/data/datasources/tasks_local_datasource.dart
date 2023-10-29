import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/models/category_model.dart';
import 'package:todo/core/storage/hive.dart';

import '../../../../../core/app/app_errors.dart';
import '../../../../../core/models/task_model.dart';

abstract class TasksLocalDatasource {
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  });
  Future<void> deleteTasks({required String categoryTitle, required String taskTitle});
  Future<List<dynamic>> fetchAllTasks();
  Future<void> updateTask({required String categoryTitle, required String oldTaskTitle, required String update});
  Future<void> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  });
  Future<void> deleteDummy();
}

class TasksLocalDatasourceImpl implements TasksLocalDatasource {
  final HiveService hiveService;
  final User? currentUser;
  TasksLocalDatasourceImpl(this.hiveService, this.currentUser);
  @override
  Future<void> addTasks({
    required String categoryTitle,
    required String taskTitle,
    String? description,
  }) async {
    try {
      // final user = FirebaseAuth.instance.currentUser;
      if (currentUser?.uid == null) {
        throw ApiFailure("No user found");
      }
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory != null) {
        debugPrint("found existing");
        final updatedCategory = CategoryModel(
          uid: currentUser!.uid,
          title: categoryTitle,
          tasks: [...existingCategory.tasks, TaskModel(uid: currentUser!.uid, title: taskTitle, completed: false)],
        );
        await hiveService.saveItem(updatedCategory, HiveBoxNames.categories.name, key: key);
      } else {
        await hiveService.saveItem(
          CategoryModel(uid: currentUser!.uid, title: categoryTitle, tasks: <TaskModel>[
            TaskModel(
              title: taskTitle,
              uid: currentUser!.uid,
              description: description,
              completed: false,
            )
          ]),
          HiveBoxNames.categories.name,
          key: key,
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
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name);
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      existingCategory.tasks.removeWhere((e) => e.title == taskTitle);
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name, key: key);
      return;
    } on ApiFailure catch (e) {
      throw ApiFailure(e.message);
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchAllTasks() async {
    try {
      final categories = await hiveService.readAll(HiveBoxNames.categories.name);
      return categories;
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
      // final user = FirebaseAuth.instance.currentUser;
      if (currentUser?.uid == null) {
        throw ApiFailure("No user found");
      }

      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name);
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      final taskIndex = existingCategory.tasks.indexWhere((e) => e.title == oldTaskTitle);
      if (taskIndex >= 0) {
        existingCategory.tasks[taskIndex] = TaskModel(
          uid: currentUser!.uid,
          title: update,
          completed: existingCategory.tasks[taskIndex].completed,
        );
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
  Future<void> markTaskAsComplete({
    required String categoryTitle,
    required String taskTitle,
  }) async {
    try {
      final key = categoryTitle.replaceAll(" ", "");
      final existingCategory = await hiveService.readItem(key, HiveBoxNames.categories.name) as CategoryModel?;
      if (existingCategory == null) {
        throw ApiFailure("Category not found");
      }
      final taskIndex = existingCategory.tasks.indexWhere((e) => e.title == taskTitle);
      if (taskIndex >= 0) {
        existingCategory.tasks[taskIndex] = TaskModel(
          uid: existingCategory.tasks[taskIndex].uid,
          title: existingCategory.tasks[taskIndex].title,
          completed: true,
        );
      } else {
        throw ApiFailure("Task not found");
      }
      await hiveService.saveItem(existingCategory, HiveBoxNames.categories.name, key: key);
      return;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<void> deleteDummy() async {
    await hiveService.deleteAll(HiveBoxNames.categories.name);
    return;
  }
}
