import 'package:equatable/equatable.dart';
import 'package:youapp_test/model/app/response_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailedState extends AuthState {
  final Object? error;

  const LoginFailedState({required this.error});
}

class RegisterSuccessState extends AuthState {
  final ResponseModel data;

  const RegisterSuccessState({required this.data});
}

class RegisterFailedState extends AuthState {
  final Object? error;

  const RegisterFailedState({required this.error});
}
