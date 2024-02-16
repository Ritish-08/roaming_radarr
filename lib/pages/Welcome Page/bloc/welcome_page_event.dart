part of 'welcome_page_bloc.dart';

@immutable
sealed class WelcomePageEvent {}

class WelcomePageInitialEvent extends WelcomePageEvent {}

class MainPageClickEvent extends WelcomePageEvent {}
