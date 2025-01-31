// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tarbiyauz/core/error/failure.dart';
import 'package:tarbiyauz/core/usecase/usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/repositories/home_repostiories.dart';

class GetAllTwitesUsecase extends Usecase<List<TwitModel>, void> {
  HomeRepostiories homeRepostiories;
  GetAllTwitesUsecase({
    required this.homeRepostiories,
  });

  @override
  Future<Either<Failure, List<TwitModel>>> call(void params) {
    return homeRepostiories.getAllTwites();
  }
}
