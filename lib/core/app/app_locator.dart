import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:todo/core/app/app_assets.dart';
import 'package:todo/core/app/app_theme.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Logger>(() => Logger());
  locator.registerLazySingleton<AppTheme>(() => AppTheme());
  locator.registerLazySingleton<Assets>(() => Assets());
}
