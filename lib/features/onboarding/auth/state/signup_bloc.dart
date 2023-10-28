import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/onboarding/auth/state/signup_event.dart';
import 'package:todo/features/onboarding/auth/state/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignupBloc({required this.emailController, required this.passwordController,}) : super(SignupState());
}
