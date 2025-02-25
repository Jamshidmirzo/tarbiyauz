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

  Future<TwitModel> getMainTweet() async {
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/main');
      if (response.statusCode == 200) {
        return TwitModel.fromJson(response.data);
      } else {
        throw ServerExcepiton();
      }
    } on DioException {
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getAllTwites() async {
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
    } on DioException {
      throw ServerExcepiton();
    } catch (e) {
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getMostViewedTwites(int? limit) async {
    List<TwitModel> twites = [];
    final response = await dio.get(
      '${AppConstants.baseUrl}twit/most-viewed',
      queryParameters: {"limit": limit ?? 10},
    );

    try {
      if (response.statusCode == 200) {
        // Приводим response.data к List<String>
        final List<String> ids = List<String>.from(response.data);

        for (String id in ids) {
          TwitModel twit = await getById(id);
          twites.add(twit);
        }
      } else {
        throw ServerExcepiton();
      }

      return twites;
    } on DioException catch (e) {
      log('Ошибка API: ${e.message}');
      throw ServerExcepiton();
    } catch (e) {
      log('Неизвестная ошибка: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<String>> getTypes() async {
    final response = await dio.get(
      '${AppConstants.baseUrl}twit/types',
    );

    try {
      if (response.statusCode == 200) {
        final List<String> ids = List<String>.from(response.data);

        return ids;
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      log('Ошибка API: ${e.message}');
      throw ServerExcepiton();
    } catch (e) {
      log('Неизвестная ошибка: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getLatestTwites(int? limit) async {
    List<TwitModel> twites = [];
    final response = await dio.get(
      '${AppConstants.baseUrl}twit/latest-uploaded',
      queryParameters: {"limit": limit ?? 10},
    );

    try {
      if (response.statusCode == 200) {
        // Приводим response.data к List<String>
        final List<String> ids = List<String>.from(response.data);

        for (String id in ids) {
          TwitModel twit = await getById(id);
          twites.add(twit);
        }
      } else {
        throw ServerExcepiton();
      }

      return twites;
    } on DioException {
      throw ServerExcepiton();
    } catch (e) {
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> getByTypeTwites(String type) async {
    log('TYPEGA KIRDI: $type');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/type/$type');

      log('Response Data: ${response.data}');
      log('Response Type: ${response.data.runtimeType}');
      log('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        if (response.data is List) {
          final List<String> ids = List<String>.from(response.data);

          // Fetch all TwitModels in parallel
          twites = await Future.wait(ids.map((id) async {
            log('Fetching twit for ID: $id');
            return getById(id);
          }));

          return twites;
        } else {
          log('Unexpected response format!');
          throw ServerExcepiton();
        }
      } else {
        throw ServerExcepiton();
      }
    } on DioException catch (e) {
      log('Dio Exception: ${e.message}');
      throw ServerExcepiton();
    } catch (e) {
      log('Other Exception: $e');
      throw ServerExcepiton();
    }
  }

  Future<List<TwitModel>> searchTwites(String title) async {
    log('SEARCH CAMEEE');
    List<TwitModel> twites = [];
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/search',
          queryParameters: {"keyword": title});

      log(response.statusCode.toString());
      log(response.data.toString());

      if (response.statusCode == 200) {
        for (var element in response.data) {
          twites.add(await getById(element));
        }
        log(twites.toString());
        return twites;
      } else {
        throw ServerExcepiton();
      }
    } on DioException {
      throw ServerExcepiton();
    } catch (e) {
      throw ServerExcepiton();
    }
  }

  Future<TwitModel> getById(String id) async {
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/$id');
      if (response.statusCode == 200) {
        return TwitModel.fromJson(response.data);
      } else {
        throw ServerExcepiton();
      }
    } on DioException {
      throw ServerExcepiton();
    }
  }

  Future<TwitModel> getByIdTwit(String id) async {
    log('${AppConstants.baseUrl}twit/$id');
    try {
      final response = await dio.get('${AppConstants.baseUrl}twit/$id');
      if (response.statusCode == 200) {
        await dio.post('${AppConstants.baseUrl}twit/$id');
        return TwitModel.fromJson(response.data);
      } else {
        throw ServerExcepiton();
      }
    } on DioException {
      throw ServerExcepiton();
    }
  }
}
