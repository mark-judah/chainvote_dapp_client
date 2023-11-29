import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<LoadingEvent>(loadingEvent);
    on<NavigateToHomePageEvent>(navigateToHomePageEvent);
  }


  FutureOr<void> loadingEvent(LoadingEvent event, Emitter<IntroState> emit) {
        emit(IntroLoadingState());
  }

  FutureOr<void> navigateToHomePageEvent(NavigateToHomePageEvent event, Emitter<IntroState> emit) {
          emit(NavigateToHomePageActionState());
  }
}
