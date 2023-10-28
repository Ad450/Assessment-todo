import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/app_locator.dart';
import 'package:todo/features/onboarding/auth/data/usecases/signup_with_google.dart';
import 'package:todo/features/onboarding/auth/data/usecases/singup_with_password.dart';
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
  create: (_) => AuthBloc(checkAuthStatus: locator.get<CheckAuthStatus>()),
);
