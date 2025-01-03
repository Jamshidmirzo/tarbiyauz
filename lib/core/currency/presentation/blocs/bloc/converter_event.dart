part of 'converter_bloc.dart';

@freezed
class ConverterEvent with _$ConverterEvent {
  const factory ConverterEvent.started() = _Started;
  const factory ConverterEvent.getCurrency() = _getCurrency;
  const factory ConverterEvent.getNotNullCurrency() = _getNotNullCurrency;


}