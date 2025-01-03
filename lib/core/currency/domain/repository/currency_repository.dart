import 'package:tarbiyauz/core/currency/domain/entity/currency_entity.dart';
import 'package:tarbiyauz/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<CurrencyEntity>>> getCurrency();
  Future<Either<Failure, List<CurrencyEntity>>> getNotNullCurrency();

}
