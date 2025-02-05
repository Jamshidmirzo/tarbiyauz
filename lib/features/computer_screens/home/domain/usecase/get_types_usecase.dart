// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tarbiyauz/core/error/failure.dart';
import 'package:tarbiyauz/core/usecase/usecase.dart';
import 'package:tarbiyauz/features/computer_screens/home/domain/repositories/home_repostiories.dart';

class GetTypesUsecase extends Usecase<List<String>, void> {
  HomeRepostiories homeRepostiories;
  GetTypesUsecase({
    required this.homeRepostiories,
  });
  @override
  Future<Either<Failure, List<String>>> call(void params) {
    return homeRepostiories.getTypes();
  }
}
