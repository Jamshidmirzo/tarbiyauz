// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:tarbiyauz/core/currency/data/model/currency_model.dart';

class CurrencyEntity {
  String title;
  String code;
  String cb_price;
  String? nbu_buy_price;
  String? nbu_cell_price;
  String date;
  CurrencyEntity({
    required this.title,
    required this.code,
    required this.cb_price,
    this.nbu_buy_price,
    this.nbu_cell_price,
    required this.date,
  });
}

extension CurrencyMapper on CurrencyEntity {
  CurrencyModel toModel() {
    return CurrencyModel(
      date: date,
        title: title,
        code: code,
        cb_price: cb_price,
        nbu_buy_price: nbu_buy_price,
        nbu_cell_price: nbu_cell_price);
  }
}
