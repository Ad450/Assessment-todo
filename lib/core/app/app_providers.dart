import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/onboarding/auth/state/signup_bloc.dart';

final signupBloc = BlocProvider(
  create: (_) => SignupBloc(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  ),
);
