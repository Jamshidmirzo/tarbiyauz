// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyModelImpl _$$CurrencyModelImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyModelImpl(
      title: json['title'] as String,
      code: json['code'] as String,
      cb_price: json['cb_price'] as String,
      nbu_buy_price: json['nbu_buy_price'] as String?,
      nbu_cell_price: json['nbu_cell_price'] as String?,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$CurrencyModelImplToJson(_$CurrencyModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cb_price,
      'nbu_buy_price': instance.nbu_buy_price,
      'nbu_cell_price': instance.nbu_cell_price,
      'date': instance.date,
    };
