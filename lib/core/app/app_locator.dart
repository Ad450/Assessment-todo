import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:todo/core/app/app_assets.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/models/category_model.dart';
import 'package:todo/core/models/task_model.dart';
import 'package:todo/core/storage/hive.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.dart';
import 'package:todo/features/home/tasks/data/repository/tasks_repository.impl.dart';
import 'package:todo/features/home/tasks/data/usecases/add_task.dart';
import 'package:todo/features/home/tasks/data/usecases/delete_tasks.dart';
import 'package:todo/features/home/tasks/data/usecases/fetch_tasks.dart';
import 'package:todo/features/home/tasks/data/usecases/mark_task_as_complete.dart';
import 'package:todo/features/home/tasks/data/usecases/update_task.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository_impl.dart';
import 'package:todo/features/onboarding/auth/data/usecases/check_auth_status.dart';
import 'package:todo/features/onboarding/auth/data/usecases/logout.dart';
import 'package:todo/features/onboarding/auth/data/usecases/singup_with_password.dart';
import 'package:hive/hive.dart';
import '../../features/home/tasks/data/datasources/tasks_local_datasource.dart';
import '../../features/onboarding/auth/data/datasources/local_datasource.dart';
import '../../features/onboarding/auth/data/usecases/signup_with_google.dart';

final locator = GetIt.instance;

void setupLocator() {
  // register hive adapters
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());

  locator.registerLazySingleton<Logger>(() => Logger());
  locator.registerLazySingleton<AppTheme>(() => AppTheme());
  locator.registerLazySingleton<Assets>(() => Assets());
  locator.registerLazySingleton<HiveService>(() => HiveService());
  locator.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(locator.get<HiveService>()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator.get<AuthLocalDatasource>()),
  );
  locator.registerLazySingleton<CheckAuthStatus>(
    () => CheckAuthStatus(locator.get<AuthRepository>()),
  );
  locator.registerLazySingleton<SignupWithGoogle>(
    () => SignupWithGoogle(locator.get<AuthRepository>()),
  );
  locator.registerLazySingleton<SignupWithEmailAndPassword>(
    () => SignupWithEmailAndPassword(locator.get<AuthRepository>()),
  );
  locator.registerLazySingleton<Logout>(
    () => Logout(),
  );

  locator.registerLazySingleton<TasksLocalDatasource>(
    () => TasksLocalDatasourceImpl(locator.get<HiveService>(), FirebaseAuth.instance.currentUser),
  );

  locator.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(locator.get<TasksLocalDatasource>()),
  );
  locator.registerLazySingleton<AddTasks>(
    () => AddTasks(locator.get<TasksRepository>()),
  );
  locator.registerLazySingleton<DeleteTask>(
    () => DeleteTask(locator.get<TasksRepository>()),
  );
  locator.registerLazySingleton<UpdateTask>(
    () => UpdateTask(locator.get<TasksRepository>()),
  );
  locator.registerLazySingleton<FetchAllTasks>(
    () => FetchAllTasks(locator.get<TasksRepository>()),
  );
  locator.registerLazySingleton<MarkTaskAsComplete>(
    () => MarkTaskAsComplete(locator.get<TasksRepository>()),
  );
}
