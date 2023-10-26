import 'package:equatable/equatable.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  }) : super(AuthState.initial()) {
    on<LoginAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStatus.loading));
        final usecase = await loginUseCase(event.params);
        usecase.fold(
          (l) {
            emit(state.copyWith(failure: l, status: AuthStatus.unAuthorized));
          },
          (r) {
            emit(state.copyWith(login: r, status: AuthStatus.authorized));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<RegisterAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStatus.loading));
        final usecase = await registerUseCase(event.params);
        usecase.fold(
          (l) {
            emit(state.copyWith(failure: l, status: AuthStatus.failure));
          },
          (r) {
            emit(state.copyWith(register: r, status: AuthStatus.success));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<LogoutAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStatus.loading));
        final usecase = await logoutUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(failure: l, status: AuthStatus.failure));
          },
          (r) {
            emit(state.copyWith(status: AuthStatus.unAuthorized));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
}
