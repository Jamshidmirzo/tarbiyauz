// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return _CurrencyModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyModel {
  String get title => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get cb_price => throw _privateConstructorUsedError;
  String? get nbu_buy_price => throw _privateConstructorUsedError;
  String? get nbu_cell_price => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this CurrencyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyModelCopyWith<CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyModelCopyWith<$Res> {
  factory $CurrencyModelCopyWith(
          CurrencyModel value, $Res Function(CurrencyModel) then) =
      _$CurrencyModelCopyWithImpl<$Res, CurrencyModel>;
  @useResult
  $Res call(
      {String title,
      String code,
      String cb_price,
      String? nbu_buy_price,
      String? nbu_cell_price,
      String date});
}

/// @nodoc
class _$CurrencyModelCopyWithImpl<$Res, $Val extends CurrencyModel>
    implements $CurrencyModelCopyWith<$Res> {
  _$CurrencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? cb_price = null,
    Object? nbu_buy_price = freezed,
    Object? nbu_cell_price = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cb_price: null == cb_price
          ? _value.cb_price
          : cb_price // ignore: cast_nullable_to_non_nullable
              as String,
      nbu_buy_price: freezed == nbu_buy_price
          ? _value.nbu_buy_price
          : nbu_buy_price // ignore: cast_nullable_to_non_nullable
              as String?,
      nbu_cell_price: freezed == nbu_cell_price
          ? _value.nbu_cell_price
          : nbu_cell_price // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyModelImplCopyWith<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  factory _$$CurrencyModelImplCopyWith(
          _$CurrencyModelImpl value, $Res Function(_$CurrencyModelImpl) then) =
      __$$CurrencyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String code,
      String cb_price,
      String? nbu_buy_price,
      String? nbu_cell_price,
      String date});
}

/// @nodoc
class __$$CurrencyModelImplCopyWithImpl<$Res>
    extends _$CurrencyModelCopyWithImpl<$Res, _$CurrencyModelImpl>
    implements _$$CurrencyModelImplCopyWith<$Res> {
  __$$CurrencyModelImplCopyWithImpl(
      _$CurrencyModelImpl _value, $Res Function(_$CurrencyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? cb_price = null,
    Object? nbu_buy_price = freezed,
    Object? nbu_cell_price = freezed,
    Object? date = null,
  }) {
    return _then(_$CurrencyModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cb_price: null == cb_price
          ? _value.cb_price
          : cb_price // ignore: cast_nullable_to_non_nullable
              as String,
      nbu_buy_price: freezed == nbu_buy_price
          ? _value.nbu_buy_price
          : nbu_buy_price // ignore: cast_nullable_to_non_nullable
              as String?,
      nbu_cell_price: freezed == nbu_cell_price
          ? _value.nbu_cell_price
          : nbu_cell_price // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyModelImpl implements _CurrencyModel {
  _$CurrencyModelImpl(
      {required this.title,
      required this.code,
      required this.cb_price,
      this.nbu_buy_price,
      this.nbu_cell_price,
      required this.date});

  factory _$CurrencyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyModelImplFromJson(json);

  @override
  final String title;
  @override
  final String code;
  @override
  final String cb_price;
  @override
  final String? nbu_buy_price;
  @override
  final String? nbu_cell_price;
  @override
  final String date;

  @override
  String toString() {
    return 'CurrencyModel(title: $title, code: $code, cb_price: $cb_price, nbu_buy_price: $nbu_buy_price, nbu_cell_price: $nbu_cell_price, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.cb_price, cb_price) ||
                other.cb_price == cb_price) &&
            (identical(other.nbu_buy_price, nbu_buy_price) ||
                other.nbu_buy_price == nbu_buy_price) &&
            (identical(other.nbu_cell_price, nbu_cell_price) ||
                other.nbu_cell_price == nbu_cell_price) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, code, cb_price, nbu_buy_price, nbu_cell_price, date);

  /// Create a copy of CurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyModelImplCopyWith<_$CurrencyModelImpl> get copyWith =>
      __$$CurrencyModelImplCopyWithImpl<_$CurrencyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyModelImplToJson(
      this,
    );
  }
}

abstract class _CurrencyModel implements CurrencyModel {
  factory _CurrencyModel(
      {required final String title,
      required final String code,
      required final String cb_price,
      final String? nbu_buy_price,
      final String? nbu_cell_price,
      required final String date}) = _$CurrencyModelImpl;

  factory _CurrencyModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyModelImpl.fromJson;

  @override
  String get title;
  @override
  String get code;
  @override
  String get cb_price;
  @override
  String? get nbu_buy_price;
  @override
  String? get nbu_cell_price;
  @override
  String get date;

  /// Create a copy of CurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyModelImplCopyWith<_$CurrencyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
