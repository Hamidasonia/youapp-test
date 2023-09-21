import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/common/constans.dart';

class Observer extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printLog("$bloc $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printLog(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printLog("$bloc $error");
    printLog(stackTrace.toString());
    super.onError(bloc, error, stackTrace);
  }
}
