part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

abstract class HomePageActionState extends HomePageState {}

class BacktoRegisterPageState extends HomePageActionState{}

class HomePageLoadingState extends HomePageState{}

class HomePageLoadedSuccessState extends HomePageState{
  final List<DataModel> products;
  HomePageLoadedSuccessState({required this.products});
}

class MovingOnDetailPageState extends HomePageActionState{
  final DataModel product;
  MovingOnDetailPageState({required this.product});
}