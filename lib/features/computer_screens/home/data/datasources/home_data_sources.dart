import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/error/exception.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';

class HomeDataSources {
  final Dio dio;

  HomeDataSources({
    required this.dio,
  });

  Future<List<TwitModel>> getAllTwites() async {
    log('HEllloogogogoogsdfghjk');
    log('${AppConstants.baseUrl}twit/all');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/all');
      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request: $e');
      throw ServerExcepiton();
    } catch (e) {
      print('An unknown error occurred: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getMostViewedTwites(int? limit) async {
    log('HEllloogogogoogsdfghjk');
    log('${AppConstants.baseUrl}twit/all');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/most-viewed',
          queryParameters: {"limit": limit ?? 10});
      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request: $e');
      throw ServerExcepiton();
    } catch (e) {
      print('An unknown error occurred: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getLatestTwites(int? limit) async {
    log('HEllloogogogoogsdfghjk');
    log('${AppConstants.baseUrl}twit/all');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get(
          '${AppConstants.baseUrl}twit/latest-uploaded',
          queryParameters: {"limit": limit ?? 10});
      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request: $e');
      throw ServerExcepiton();
    } catch (e) {
      print('An unknown error occurred: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getByTypeTwites(String type) async {
    log('HEllloogogogoogsdfghjk');
    log('${AppConstants.baseUrl}twit/all');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}twit/type/$type',
      );
      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request: $e');
      throw ServerExcepiton();
    } catch (e) {
      print('An unknown error occurred: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> searchTwites(String title) async {
    log('HEllloogogogoogsdfghjk');
    log('${AppConstants.baseUrl}twit/all');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/search',
          queryParameters: {"keyword": title});
      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request: $e');
      throw ServerExcepiton();
    } catch (e) {
      print('An unknown error occurred: $e');
      throw ServerExcepiton();
    }
  }

  Future<TwitModel> getById(String id) async {
    log('${AppConstants.baseUrl}twit/$id');
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/$id');
      if (response.statusCode == 200) {
        return TwitModel.fromJson(response.data);
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      print('Error during API request for Twit ID $id: $e');
      throw ServerExcepiton();
    }
  }
}
