// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_all_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_id_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_type_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_last_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_main_tweet_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_most_viewed_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_types_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/search_twites_usecase.dart';

// Define HomeEvent
abstract class HomeEvent {}

class GetAllTwitesEvent extends HomeEvent {}

class GetByTypeTwitesEvent extends HomeEvent {
  String type;
  GetByTypeTwitesEvent({
    required this.type,
  });
}

class GetLatestTwitesEvent extends HomeEvent {}

class GetMostTwitesEvent extends HomeEvent {}

class GetMainTwitesEvent extends HomeEvent {}

class GetTypesEvent extends HomeEvent {}

class GetByIdTwitesEvent extends HomeEvent {
  String id;
  GetByIdTwitesEvent({
    required this.id,
  });
}

class GetBySearchTwitesEvent extends HomeEvent {
  String title;
  GetBySearchTwitesEvent({
    required this.title,
  });
}

// Define HomeState
class HomeState {
  final Status status;
  final List<TwitModel>? twites;
  final List<TwitModel>? latestTwites;
  TwitModel? twit;
  TwitModel? mainTwit;
  List<TwitModel>? mostVievedTwites;
  List<TwitModel>? searchedResultTwites;
  List<TwitModel>? typesTwites;
  List<String>? types;

  HomeState(
      {this.status = Status.Loading,
      this.mainTwit,
      this.twites,
      this.latestTwites,
      this.mostVievedTwites,
      this.twit,
      this.types,
      this.searchedResultTwites,
      this.typesTwites});

  HomeState copyWith({
    Status? status,
    List<TwitModel>? twites,
    List<TwitModel>? latestTwites,
    List<TwitModel>? mostVievedTwites,
    TwitModel? twit,
    List<String>? types,
    List<TwitModel>? searchedResultTwites,
    List<TwitModel>? typesTwites,
    TwitModel? mainTwit,
  }) {
    return HomeState(
      status: status ?? this.status,
      twites: twites ?? this.twites,
      latestTwites: latestTwites ?? this.latestTwites,
      mostVievedTwites: mostVievedTwites ?? this.mostVievedTwites,
      twit: twit ?? this.twit,
      types: types ?? this.types,
      searchedResultTwites: searchedResultTwites ?? this.searchedResultTwites,
      typesTwites: typesTwites ?? this.typesTwites,
      mainTwit: mainTwit ?? this.mainTwit,
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
  GetTypesUsecase getTypesUsecase;
  GetMainTweetUsecase getMainTweetUsecase;
  HomeBloc(
    this.getAllTwitesUsecase,
    this.getByIdTwitesUsecase,
    this.getByTypeTwitesUsecase,
    this.getLastTwitesUsecase,
    this.getMostViewedUsecase,
    this.searchTwitesUsecase,
    this.getTypesUsecase,
    this.getMainTweetUsecase,
  ) : super(HomeState()) {
    on<GetAllTwitesEvent>(_onGetAllTwites);
    on<GetLatestTwitesEvent>(_onGetLatestTwites);
    on<GetMostTwitesEvent>(_onMostViewedLatestTwites);
    on<GetByIdTwitesEvent>(_onByTwites);
    on<GetTypesEvent>(_onGetTwites);
    on<GetBySearchTwitesEvent>(_onGetSearchTwites);
    on<GetByTypeTwitesEvent>(_onGetTypeTwites);
    on<GetMainTwitesEvent>(_onGetMainTwite);
  }

  Future<void> _onGetMainTwite(
      GetMainTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getMainTweetUsecase(null);
    log(responce.toString());
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, mainTwit: data));
    });
  }

  Future<void> _onGetTypeTwites(
      GetByTypeTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getByTypeTwitesUsecase(event.type);
    log(responce.toString());
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, typesTwites: data));
    });
  }

  Future<void> _onGetSearchTwites(
      GetBySearchTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await searchTwitesUsecase(event.title);

    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, searchedResultTwites: data));
    });
  }

  Future<void> _onGetTwites(
      GetTypesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getTypesUsecase(null);

    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, types: data));
    });
  }

  Future<void> _onByTwites(
      GetByIdTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getByIdTwitesUsecase(event.id);

    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, twit: data));
    });
  }

  Future<void> _onMostViewedLatestTwites(
      GetMostTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getMostViewedUsecase(null);
    log('Event received: $responce');
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      log('$data MOSrTED FROM BLOC');
      emit(state.copyWith(status: Status.Success, mostVievedTwites: data));
    });
  }

  Future<void> _onGetAllTwites(
      GetAllTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getAllTwitesUsecase(null);
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, twites: data));
    });
  }

  Future<void> _onGetLatestTwites(
      GetLatestTwitesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.Loading));

    final responce = await getLastTwitesUsecase(null);

    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, latestTwites: data));
    });
  }
}
