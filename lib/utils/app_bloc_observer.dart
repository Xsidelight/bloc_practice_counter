import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('Bloc: $bloc, Change: $change');
    super.onChange(bloc, change);
  }


  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Bloc: $bloc, Event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase bloc) {
    print(bloc);
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error occurred in: $bloc, error: $error, stacktrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('On transition: $bloc, $transition');
    super.onTransition(bloc, transition);
  }
}