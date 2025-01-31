// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tarbiyauz/core/error/failure.dart';
import 'package:tarbiyauz/core/usecase/usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/repositories/home_repostiories.dart';

class GetMostViewedUsecase extends Usecase<List<TwitModel>, int?> {
  HomeRepostiories homeRepostiories;
  GetMostViewedUsecase({
    required this.homeRepostiories,
  });
  @override
  Future<Either<Failure, List<TwitModel>>> call(int? params) {
    return homeRepostiories.getMostViewedTwites(params);
  }
}
