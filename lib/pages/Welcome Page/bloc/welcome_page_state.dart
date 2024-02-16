part of 'welcome_page_bloc.dart';

@immutable
sealed class WelcomePageState {}

final class WelcomePageInitial extends WelcomePageState {}

abstract class WelcomePageActionState extends WelcomePageState {}

class WelcomePageSucessState extends WelcomePageState {}

class MovingToMainPage extends WelcomePageActionState {}
