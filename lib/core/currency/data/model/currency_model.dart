// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tarbiyauz/core/currency/domain/entity/currency_entity.dart';
part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  factory CurrencyModel({
    required String title,
    required String code,
    required String cb_price,
    String? nbu_buy_price,
    String? nbu_cell_price,
    required String date,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}

extension CurrencyMapper on CurrencyModel {
  CurrencyEntity toEntity() {
    return CurrencyEntity(
        date: date,
        title: title,
        code: code,
        cb_price: cb_price,
        nbu_buy_price: nbu_buy_price,
        nbu_cell_price: nbu_cell_price);
  }
}
