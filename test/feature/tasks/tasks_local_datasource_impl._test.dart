import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/app/app_errors.dart';
import 'package:todo/core/models/category_model.dart';
import 'package:todo/core/models/task_model.dart';
import 'package:todo/core/storage/hive.dart';
import 'package:todo/features/home/tasks/data/datasources/tasks_local_datasource.dart';

import 'firebase_mocks.dart';
import 'tasks_local_datasource_impl._test.mocks.dart';

@GenerateMocks([HiveService])
void main() {
  final key = "testkey";
  final categoryTitle = "testkey";
  final taskTitle = "taskTitle";
  final boxName = HiveBoxNames.categories.name;
  final category = CategoryModel(
    uid: "uid",
    title: "title",
    tasks: [
      TaskModel(
        completed: false,
        uid: "uid",
        title: "title",
        description: "description",
      ),
    ],
  );
  final mockUser = MockUser();
  late MockHiveService mockHiveService;
  late TasksLocalDatasourceImpl tasksLocalDatasourceImpl;

  setUp(() {
    mockHiveService = MockHiveService();
    tasksLocalDatasourceImpl = TasksLocalDatasourceImpl(mockHiveService, mockUser);
  });

  test("should add task to existing category", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => category);
    when(mockHiveService.saveItem(category, "categories", key: key));
    // act
    await tasksLocalDatasourceImpl.addTasks(categoryTitle: categoryTitle, taskTitle: taskTitle);
    // assert
    verify(mockHiveService.readItem(key, "categories"));
    verify(
      mockHiveService.saveItem(
        CategoryModel(
          uid: mockUser.uid,
          title: categoryTitle,
          tasks: [
            ...category.tasks,
            TaskModel(uid: mockUser.uid, title: taskTitle, completed: false),
          ],
        ),
        boxName,
        key: key,
      ),
    );
    verifyNoMoreInteractions(mockHiveService);
  });

  test("should create a new category for a task", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => null);
    when(mockHiveService.saveItem(category, "categories", key: key));
    // act
    await tasksLocalDatasourceImpl.addTasks(categoryTitle: categoryTitle, taskTitle: taskTitle);
    // assert
    verify(mockHiveService.readItem(key, "categories"));
    verify(
      mockHiveService.saveItem(
        CategoryModel(uid: mockUser.uid, title: categoryTitle, tasks: [
          TaskModel(uid: mockUser.uid, title: taskTitle, completed: false),
        ]),
        boxName,
        key: key,
      ),
    );
    verifyNoMoreInteractions(mockHiveService);
  });
  test("should throw no user found on null uid", () async {});
  test("detele tasks", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => category);
    when(mockHiveService.saveItem(category, "categories", key: key));
    // act
    await tasksLocalDatasourceImpl.deleteTasks(categoryTitle: categoryTitle, taskTitle: taskTitle);
    // assert
    verify(mockHiveService.readItem(key, "categories"));
    verify(
      mockHiveService.saveItem(
        category,
        boxName,
        key: key,
      ),
    );
    verifyNoMoreInteractions(mockHiveService);
  });

  test("deleteTasks should throw no category found on no category found", () async {
    //arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => null);

    // act  and assert
    expect(
      () async => await tasksLocalDatasourceImpl.deleteTasks(categoryTitle: categoryTitle, taskTitle: taskTitle),
      throwsA(isA<ApiFailure>()),
    );
    verify(mockHiveService.readItem(key, "categories"));
    verifyNoMoreInteractions(mockHiveService);
  });

  test("should fetch all tasks", () async {
    // arrange
    when(mockHiveService.readAll("categories")).thenAnswer((_) async => []);
    // act
    final result = await tasksLocalDatasourceImpl.fetchAllTasks();
    // assert
    expect(result, isA<List>());
  });

  test("should update tasks when given required params", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => category);
    when(mockHiveService.saveItem(category, "categories", key: key));

    // act
    await tasksLocalDatasourceImpl.updateTask(categoryTitle: categoryTitle, oldTaskTitle: "title", update: "update");

    // assert
    verify(mockHiveService.readItem(key, "categories"));
    verify(
      mockHiveService.saveItem(
        category,
        boxName,
        key: key,
      ),
    );
    verifyNoMoreInteractions(mockHiveService);
  });

  test("update task should throw ApiFailure on no category found", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => null);

    // act and assert
    expect(
      () async => await tasksLocalDatasourceImpl.updateTask(
        categoryTitle: categoryTitle,
        oldTaskTitle: "title",
        update: "update",
      ),
      throwsA(isA<ApiFailure>()),
    );
    verify(mockHiveService.readItem(key, "categories"));
    verifyNoMoreInteractions(mockHiveService);
  });

  test("should mark tasks as complete when given required params", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => category);
    when(mockHiveService.saveItem(category, "categories", key: key));

    // act
    await tasksLocalDatasourceImpl.markTaskAsComplete(categoryTitle: categoryTitle, taskTitle: "title");

    // assert
    verify(mockHiveService.readItem(key, "categories"));
    verify(
      mockHiveService.saveItem(
        category,
        boxName,
        key: key,
      ),
    );
    verifyNoMoreInteractions(mockHiveService);
  });

  test("mark task as complete should throw ApiFailure on no category found", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => null);

    // act and assert
    expect(
      () async => await tasksLocalDatasourceImpl.markTaskAsComplete(
        categoryTitle: categoryTitle,
        taskTitle: "title",
      ),
      throwsA(isA<ApiFailure>()),
    );
    verify(mockHiveService.readItem(key, "categories"));
    verifyNoMoreInteractions(mockHiveService);
  });
}
