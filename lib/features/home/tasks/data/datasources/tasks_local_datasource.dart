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

  TasksLocalDatasourceImpl(this.hiveService);
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
        debugPrint("found existing");
        final updatedCategory = existingCategory.tasks.add(
          TaskModel(uid: user!.uid, title: taskTitle, completed: false),
        );
        await hiveService.saveItem(updatedCategory, HiveBoxNames.categories.name, key: key);
      } else {
        await hiveService.saveItem(
          CategoryModel(uid: user!.uid, title: categoryTitle, tasks: <TaskModel>[
            TaskModel(
              title: taskTitle,
              uid: user.uid,
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
      final category = CategoryModel.fromJson(existingCategory);
      category.tasks.removeWhere((e) => e.title == taskTitle);
      await hiveService.saveItem(category, HiveBoxNames.categories.name, key: key);
      return;
    } catch (e) {
      throw ApiFailure(e.toString());
    }
  }

  @override
  Future<List<dynamic>> fetchAllTasks() async {
    try {
      final categories = await hiveService.readAll(HiveBoxNames.categories.name);
      // return categories
      //     .map(
      //       (e) => CategoryModel.fromJson({
      //         "uid": e.uid,
      //         "tasks": e.tasks,
      //         "title": e.title,
      //       }),
      //     )
      //     .toList();
      return categories;
    } catch (e) {
      print(e.toString());
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
        existingCategory.tasks[taskIndex] = TaskModel(
          uid: user!.uid,
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
