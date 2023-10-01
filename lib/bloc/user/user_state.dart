import 'package:equatable/equatable.dart';
import 'package:youapp_test/model/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class GetUserSuccessState extends UserState {
  final UserModel data;

  const GetUserSuccessState({required this.data});
}

class GetUserFailedState extends UserState {
  final Object? error;

  const GetUserFailedState({required this.error});
}

class UpdateUserSuccessState extends UserState {
  final UserModel data;

  const UpdateUserSuccessState({required this.data});
}

class UpdateUserFailedState extends UserState {
  final Object? error;

  const UpdateUserFailedState({required this.error});
}

class CreateUserSuccessState extends UserState {
  final UserModel data;

  const CreateUserSuccessState({required this.data});
}

class CreateUserFailedState extends UserState {
  final Object? error;

  const CreateUserFailedState({required this.error});
}
