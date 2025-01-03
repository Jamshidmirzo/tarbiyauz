import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tarbiyauz/core/currency/data/datasources/currency_datasources.dart';
import 'package:tarbiyauz/core/currency/data/repositories/currency_repositories.dart';
import 'package:tarbiyauz/core/currency/presentation/blocs/bloc/converter_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => ConverterBloc(sl<CurrencyRepositoriesImpl>()));
  sl.registerFactory(
      () => CurrencyRepositoriesImpl(currencyDatasources: sl<CurrencyDatasources>()));
  sl.registerFactory(() => CurrencyDatasources(dio: Dio()));
}
