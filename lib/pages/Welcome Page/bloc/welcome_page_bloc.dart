import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_page_event.dart';
part 'welcome_page_state.dart';

class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(WelcomePageInitial()) {
    on<WelcomePageInitialEvent>(welcomePageInitialEvent);
    on<MainPageClickEvent>(mainPageClickEvent);
  }

  FutureOr<void> mainPageClickEvent(
      MainPageClickEvent event, Emitter<WelcomePageState> emit) {
    emit(MovingToMainPage());
  }

  FutureOr<void> welcomePageInitialEvent(
      WelcomePageInitialEvent event, Emitter<WelcomePageState> emit) {
    emit(WelcomePageSucessState());
  }
}
