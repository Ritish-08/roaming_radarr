import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:roaming_radarr/services/data_services.dart';

import '../../../../model/data_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final DataServices dataServices = DataServices();
  HomePageBloc() : super(HomePageInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<ClickingonEachProductImage>(clickingonEachProductImage);
   on<MovingToRegisterPage>(movingToRegisterPage);
  }

  FutureOr<void> movingToRegisterPage(MovingToRegisterPage event, Emitter<HomePageState> emit) {
    emit(BacktoRegisterPageState());
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomePageState> emit) async{
    emit(HomePageLoadingState());
    Future.delayed(Duration(seconds: 2),);
    List<DataModel> products = await dataServices.getInfo();
   emit(HomePageLoadedSuccessState(products: products));
  }

  FutureOr<void> clickingonEachProductImage(ClickingonEachProductImage event, Emitter<HomePageState> emit) {
   emit(MovingOnDetailPageState(product: event.clickedProduct));
  }
}
