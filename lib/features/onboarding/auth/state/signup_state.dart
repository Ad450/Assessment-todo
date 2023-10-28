abstract class SignupState {}

class SignupStateInitial extends SignupState {}

class SignupStateSuccessfulState extends SignupState {}

class SignupStateError extends SignupState {
    final String message;
  SignupStateError(this.message);
}

class SignupLoading extends SignupState {}
