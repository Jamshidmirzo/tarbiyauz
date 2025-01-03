// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:tarbiyauz/core/currency/data/repositories/currency_repositories.dart';
import 'package:tarbiyauz/core/currency/domain/entity/currency_entity.dart';
import 'package:tarbiyauz/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tarbiyauz/core/constants/app_constants.dart';

part 'converter_bloc.freezed.dart';
part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  CurrencyRepositoriesImpl currencyRepositoriesImpl;
  ConverterBloc(
    this.currencyRepositoriesImpl,
  ) : super(ConverterState()) {
    on<_getCurrency>(_getAll);
    on<_getNotNullCurrency>(_getNotNullAll);
  }
  Future<void> _getAll(_getCurrency event, Emitter<ConverterState> emit) async {
    emit(state.copyWith(status: Status.Loading));
    final responce = await currencyRepositoriesImpl.getCurrency();
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
        message: failureMessage(error),
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, entities: data));
    });
  }

  Future<void> _getNotNullAll(
      _getNotNullCurrency event, Emitter<ConverterState> emit) async {
    emit(state.copyWith(status: Status.Loading));
    final responce = await currencyRepositoriesImpl.getNotNullCurrency();
    responce.fold((error) {
      emit(state.copyWith(
        status: Status.Error,
        message: failureMessage(error),
      ));
    }, (data) {
      emit(state.copyWith(status: Status.Success, entities: data));
    });
  }
}

String failureMessage(Failure failure) {
  switch (failure) {
    case ServerFailure():
      return "Server Error";
    case CacheFailure():
      return "Chace Errro";
    default:
      return "Get smth wrong from APi";
  }
}
