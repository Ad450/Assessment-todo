import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/app_usecase.dart';
import 'package:todo/features/onboarding/auth/data/usecases/check_auth_status.dart';
import 'package:todo/features/onboarding/auth/state/auth_events.dart';
import 'package:todo/features/onboarding/auth/state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthStatus checkAuthStatus;

  AuthBloc({required this.checkAuthStatus}) : super(AuthStateInitial()) {
    on<OnAppStarted>(_checkAuthStatus);
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
}
