part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, authorized, unAuthorized, failure }

class AuthState extends Equatable {
  const AuthState({
    this.failure,
    this.status = AuthStatus.initial,
    this.login,
    this.register,
    this.version = '1.0.0',
  });

  factory AuthState.initial() {
    return const AuthState();
  }

  final AuthStatus status;
  final String version;
  final Failure? failure;
  final Login? login;
  final Register? register;

  AuthState copyWith({
    AuthStatus? status,
    Failure? failure,
    Login? login,
    Register? register,
    String? version,
  }) {
    return AuthState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      login: login ?? this.login,
      register: register ?? this.register,
      version: version ?? this.version,
    );
  }

  @override
  List<Object?> get props => [failure, version, status, login, register];
}
