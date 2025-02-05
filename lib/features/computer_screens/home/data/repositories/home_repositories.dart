// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tarbiyauz/core/error/failure.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/datasources/home_data_sources.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/repositories/home_repostiories.dart';

class HomeRepositoriesImpl extends HomeRepostiories {
  HomeDataSources homeDataSources;
  HomeRepositoriesImpl({
    required this.homeDataSources,
  });
  @override
  Future<Either<Failure, List<TwitModel>>> getAllTwites() async {
    try {
      final responce = await homeDataSources.getAllTwites();
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TwitModel>> getByIdTwites(String id) async {
    try {
      final responce = await homeDataSources.getByIdTwit(id);
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TwitModel>>> getByTypeTwites(String type) async {
    try {
      final responce = await homeDataSources.getByTypeTwites(type);
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TwitModel>>> getLatestTwites(int? limit) async {
    try {
      final responce = await homeDataSources.getLatestTwites(limit);
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TwitModel>>> getMostViewedTwites(
      int? limit) async {
    try {
      final responce = await homeDataSources.getMostViewedTwites(limit);
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TwitModel>>> searchTwites(String title) async {
    try {
      final responce = await homeDataSources.searchTwites(title);
      return Right(responce);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getTypes() async {
    try {
      return Right(await homeDataSources.getTypes());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
