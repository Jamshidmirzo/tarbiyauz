import 'package:dartz/dartz.dart';
import 'package:tarbiyauz/core/error/failure.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';

abstract class HomeRepostiories {
  Future<Either<Failure, List<TwitModel>>> getAllTwites();
  Future<Either<Failure, List<TwitModel>>> getLatestTwites(int? limit);
  Future<Either<Failure, List<TwitModel>>> getMostViewedTwites(int? limit);
  Future<Either<Failure, List<TwitModel>>> searchTwites(String title);
  Future<Either<Failure, TwitModel>> getByIdTwites(String id);
  Future<Either<Failure, TwitModel>> getMainTweet();
  Future<Either<Failure, List<TwitModel>>> getByTypeTwites(String type);
  Future<Either<Failure, List<String>>> getTypes();
}
