import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/onboarding/auth/data/usecases/signup_with_google.dart';
import 'package:todo/features/onboarding/auth/data/usecases/singup_with_password.dart';
import 'package:todo/features/onboarding/auth/state/signup_event.dart';
import 'package:todo/features/onboarding/auth/state/signup_state.dart';

import '../../../../core/app/app_usecase.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final SignupWithEmailAndPassword signupWithEmailAndPassword;
  final SignupWithGoogle signupWithGoogle;

  SignupBloc({
    required this.emailController,
    required this.passwordController,
    required this.signupWithEmailAndPassword,
    required this.signupWithGoogle,
  }) : super(SignupStateInitial()) {
    on<SignupWithGoogleEvent>(_signupWithGoogle);
    on<SignupWithPasswordEvent>(_signupWithEmailAndPassword);
  }

  Future<void> _signupWithGoogle(SignupWithGoogleEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    final result = await signupWithGoogle(const NoParam());
    result.fold(
      (l) => emit(SignupStateError(l.message)),
      (r) => emit(SignupStateSuccessfulState()),
    );
  }

  Future<void> _signupWithEmailAndPassword(SignupWithPasswordEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    final result = await signupWithEmailAndPassword(SignupWithEmailAndPasswordParam(
      email: emailController.text,
      password: passwordController.text,
    ));
    result.fold(
      (l) => emit(SignupStateError(l.message)),
      (r) => emit(SignupStateSuccessfulState()),
    );
  }
}
