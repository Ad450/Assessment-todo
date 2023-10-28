import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:todo/core/app/app_assets.dart';
import 'package:todo/core/app/app_theme.dart';
import 'package:todo/core/storage/hive.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository.dart';
import 'package:todo/features/onboarding/auth/data/repository/auth_repository_impl.dart';
import 'package:todo/features/onboarding/auth/data/usecases/check_auth_status.dart';
import 'package:todo/features/onboarding/auth/data/usecases/singup_with_password.dart';

import '../../features/onboarding/auth/data/datasources/local_datasource.dart';
import '../../features/onboarding/auth/data/usecases/signup_with_google.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Logger>(() => Logger());
  locator.registerLazySingleton<AppTheme>(() => AppTheme());
  locator.registerLazySingleton<Assets>(() => Assets());
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
}
