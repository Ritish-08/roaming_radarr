part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class MovingToRegisterPage extends HomePageEvent{}

class HomeInitialEvent extends HomePageEvent{}

class ClickingonEachProductImage extends HomePageEvent{
  final DataModel clickedProduct;
  ClickingonEachProductImage({required this.clickedProduct});
}