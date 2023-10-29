import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/features/home/tasks/data/usecases/add_task.dart';
import 'package:todo/features/home/tasks/data/usecases/delete_tasks.dart';
import 'package:todo/features/home/tasks/data/usecases/fetch_tasks.dart';
import 'package:todo/features/home/tasks/data/usecases/mark_task_as_complete.dart';
import 'package:todo/features/home/tasks/data/usecases/update_task.dart';
import 'package:todo/features/home/tasks/state/tasks_bloc.dart';
import 'package:todo/features/onboarding/auth/data/usecases/logout.dart';
import 'package:todo/features/onboarding/auth/data/usecases/signup_with_google.dart';
import 'package:todo/features/onboarding/auth/data/usecases/singup_with_password.dart';
import 'package:todo/features/onboarding/auth/state/auth_events.dart';
import 'package:todo/features/onboarding/auth/state/signup_bloc.dart';

import '../../features/onboarding/auth/data/usecases/check_auth_status.dart';
import '../../features/onboarding/auth/state/auth_bloc.dart';

final signupBloc = BlocProvider(
  create: (_) => SignupBloc(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      signupWithGoogle: locator.get<SignupWithGoogle>(),
      signupWithEmailAndPassword: locator.get<SignupWithEmailAndPassword>()),
);

final authBloc = BlocProvider(
  create: (_) => AuthBloc(
    checkAuthStatus: locator.get<CheckAuthStatus>(),
    logout: locator.get<Logout>(),
  )..add(OnAppStarted()),
);

final taskBloc = BlocProvider(
  create: (_) => TasksBloc(
      addTask: locator.get<AddTasks>(),
      deleteTask: locator.get<DeleteTask>(),
      fetchAllTasks: locator.get<FetchAllTasks>(),
      updateTask: locator.get<UpdateTask>(),
      markTaskAsComplete: locator.get<MarkTaskAsComplete>()),
);
