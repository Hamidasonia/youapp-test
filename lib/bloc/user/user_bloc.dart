import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/bloc/user/user_event.dart';
import 'package:youapp_test/bloc/user/user_state.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/data/request.dart';
import 'package:youapp_test/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserEvent) {
      yield* _getUser(event);
    } else if (event is UpdateUserEvent) {
      yield* _updateUser(event);
    } else if (event is CreateUserEvent) {
      yield* _createUser(event);
    }
  }

  Stream<UserState> _getUser(GetUserEvent event) async* {
    yield UserInitialState();
    try {
      Response res = await Request().user.get();
      UserModel user = UserModel.fromJson(res.data);
      yield GetUserSuccessState(data: user);
    } catch (e) {
      yield GetUserFailedState(error: e);
      printLog(e);
    }
  }

  Stream<UserState> _updateUser(UpdateUserEvent event) async* {
    yield UserInitialState();
    try {
      Response res = await Request().user.update(
            name: event.name,
            birthday: event.birthday,
            height: event.height,
            weight: event.weight,
            interests: event.interest,
          );
      UserModel user = UserModel.fromJson(res.data);
      yield UpdateUserSuccessState(data: user);
    } catch (e) {
      yield UpdateUserFailedState(error: e);
      printLog(e);
    }
  }

  Stream<UserState> _createUser(CreateUserEvent event) async* {
    yield UserInitialState();
    try {
      Response res = await Request().user.create(
            name: event.name,
            birthday: event.birthday,
            height: event.height,
            weight: event.weight,
            interests: event.interest,
          );
      UserModel user = UserModel.fromJson(res.data);
      yield CreateUserSuccessState(data: user);
    } catch (e) {
      yield CreateUserFailedState(error: e);
      printLog(e);
    }
  }
}
