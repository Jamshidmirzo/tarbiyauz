part of 'converter_bloc.dart';

@freezed
class ConverterState with _$ConverterState {
  factory ConverterState({
    @Default(Status.Loading) Status status,
    List<CurrencyEntity>? entities,
    String? message,
  }) = _CurrencyState;
}
