// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_all_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_id_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_type_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_last_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_most_viewed_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/search_twites_usecase.dart';

// Define HomeEvent
abstract class HomeEvent {}

class GetAllTwitesEvent extends HomeEvent {}

// Define HomeState
class HomeState {
  final Status status;
  final List<TwitModel>? twites;

  HomeState({this.status = Status.Loading, this.twites});

  HomeState copyWith({
    Status? status,
    List<TwitModel>? twites,
  }) {
    return HomeState(
      status: status ?? this.status,
      twites: twites ?? this.twites,
    );
  }
}

// Define HomeBloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllTwitesUsecase getAllTwitesUsecase;
  GetByIdTwitesUsecase getByIdTwitesUsecase;
  GetByTypeTwitesUsecase getByTypeTwitesUsecase;
  GetLastTwitesUsecase getLastTwitesUsecase;
  GetMostViewedUsecase getMostViewedUsecase;
  SearchTwitesUsecase searchTwitesUsecase;
  HomeBloc(
    this.getAllTwitesUsecase,
    this.getByIdTwitesUsecase,
    this.getByTypeTwitesUsecase,
    this.getLastTwitesUsecase,
    this.getMostViewedUsecase,
    this.searchTwitesUsecase,
  ) : super(HomeState()) {
    on<GetAllTwitesEvent>(_onGetAllTwites);
  }

  Future<void> _onGetAllTwites(
      GetAllTwitesEvent event, Emitter<HomeState> emit) async {
    log('YOQILDIID');
    emit(state.copyWith(status: Status.Loading));

    final responce = await getAllTwitesUsecase(null);
    log('Event received: $responce');
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, twites: data));
    });
  }
}
