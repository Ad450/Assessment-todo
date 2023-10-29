import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/app_usecase.dart';
import 'package:todo/features/onboarding/auth/data/usecases/check_auth_status.dart';
import 'package:todo/features/onboarding/auth/state/auth_events.dart';
import 'package:todo/features/onboarding/auth/state/auth_state.dart';

import '../data/usecases/logout.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatus checkAuthStatus;
  final Logout logout;

  AuthBloc({
    required this.checkAuthStatus,
    required this.logout,
  }) : super(AuthStateInitial()) {
    on<OnAppStarted>(_checkAuthStatus);
    on<SignoutEvent>(_logout);
  }

  Future<void> _checkAuthStatus(OnAppStarted event, Emitter<AuthState> emit) async {
    final result = await checkAuthStatus(const NoParam());
    result.fold(
      (l) => emit(AuthErrorState(l.message)),
      (r) {
        if (r == null) {
          emit(UnauthenticatedState());
        } else {
          emit(AuthenticatedState());
        }
      },
    );
  }

  Future<void> _logout(SignoutEvent event, Emitter<AuthState> emit) async {
    final result = await logout(const NoParam());
    result.fold(
      (l) => emit(AuthErrorState(l.message)),
      (r) => emit(UnauthenticatedState()),
    );
  }
}
