import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<UserEvent> get props => [];
}

class GetUserEvent extends UserEvent {
  @override
  String toString() => 'GetUserEvent';
}

class UpdateUserEvent extends UserEvent {
  final String name;
  final String birthday;
  final int height;
  final int weight;
  final List<String>? interest;

  const UpdateUserEvent({
    required this.name,
    required this.birthday,
    required this.height,
    required this.weight,
    this.interest,
  });

  @override
  String toString() => 'UpdateUserEvent';
}

class CreateUserEvent extends UserEvent {
  final String name;
  final String birthday;
  final int height;
  final int weight;
  final List<String> interest;

  const CreateUserEvent({
    required this.name,
    required this.birthday,
    required this.height,
    required this.weight,
    required this.interest,
  });

  @override
  String toString() => 'CreateUserEvent';
}
