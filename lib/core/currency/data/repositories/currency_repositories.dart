// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tarbiyauz/core/currency/data/datasources/currency_datasources.dart';
import 'package:tarbiyauz/core/currency/data/model/currency_model.dart';
import 'package:tarbiyauz/core/currency/domain/entity/currency_entity.dart';
import 'package:tarbiyauz/core/currency/domain/repository/currency_repository.dart';
import 'package:tarbiyauz/core/error/failure.dart';

class CurrencyRepositoriesImpl extends CurrencyRepository {
  CurrencyDatasources currencyDatasources;
  CurrencyRepositoriesImpl({
    required this.currencyDatasources,
  });
  @override
  Future<Either<Failure, List<CurrencyEntity>>> getCurrency() async {
    return await _getCurrency(() => currencyDatasources.getCurrency());
  }

  Future<Either<Failure, List<CurrencyEntity>>> _getCurrency(
      Future<List<CurrencyModel>> Function() currency) async {
    try {
      List<CurrencyModel> models = await currency();
      List<CurrencyEntity> entities =
          models.map((element) => element.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getNotNullCurrency() {
    return _notNull(() => currencyDatasources.getCurrency());
  }

  Future<Either<Failure, List<CurrencyEntity>>> _notNull(
      Future<List<CurrencyModel>> Function() currency) async {
    try {
      List<CurrencyModel> models = await currency();
      List<CurrencyEntity> entities = [];
      for (var element in models) {
        if (element.nbu_buy_price != '') {
          entities.add(element.toEntity());
        }
      }
      return Right(entities);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
