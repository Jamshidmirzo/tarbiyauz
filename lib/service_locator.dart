import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tarbiyauz/core/config/dio_config.dart';

import 'package:tarbiyauz/features/computer_screens/home/data/datasources/home_data_sources.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/repositories/home_repositories.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_all_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_id_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_by_type_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_last_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_main_tweet_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_most_viewed_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/get_types_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/usecase/search_twites_usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // ignore: unused_local_variable
  final dio = DioConfig().client;

  sl.registerCachedFactory(() => HomeDataSources(dio: Dio()));
  sl.registerCachedFactory(
      () => HomeRepositoriesImpl(homeDataSources: sl<HomeDataSources>()));
  sl.registerCachedFactory(
      () => GetAllTwitesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));
  sl.registerCachedFactory(
      () => GetByIdTwitesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(() =>
      GetByTypeTwitesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(
      () => GetLastTwitesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(
      () => GetMostViewedUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(
      () => SearchTwitesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(
      () => GetMainTweetUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));

  sl.registerCachedFactory(
      () => GetTypesUsecase(homeRepostiories: sl<HomeRepositoriesImpl>()));
  sl.registerCachedFactory(() => HomeBloc(
        sl<GetAllTwitesUsecase>(),
        sl<GetByIdTwitesUsecase>(),
        sl<GetByTypeTwitesUsecase>(),
        sl<GetLastTwitesUsecase>(),
        sl<GetMostViewedUsecase>(),
        sl<SearchTwitesUsecase>(),
        sl<GetTypesUsecase>(),
        sl<GetMainTweetUsecase>(),
      ));
}
