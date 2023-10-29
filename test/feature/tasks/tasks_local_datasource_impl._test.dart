import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/app/app_errors.dart';
import 'package:todo/core/models/category_model.dart';
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
  final category = CategoryModel(uid: "uid", title: "title", tasks: []);
  late MockHiveService mockHiveService;
  late TasksLocalDatasourceImpl tasksLocalDatasourceImpl;

  setUp(() {
    mockHiveService = MockHiveService();
    tasksLocalDatasourceImpl = TasksLocalDatasourceImpl(mockHiveService, MockUser());
  });

  test(" should add task to existing category", () async {
    // arrange
    when(mockHiveService.readItem(key, "categories")).thenAnswer((_) async => category);
    when(mockHiveService.saveItem(category, "categories", key: key));
    // act
    await tasksLocalDatasourceImpl.addTasks(categoryTitle: categoryTitle, taskTitle: taskTitle);
    // assert
    verify(mockHiveService.saveItem(category, boxName, key: key)).called(1);
    verifyNoMoreInteractions(mockHiveService);
  });
}
