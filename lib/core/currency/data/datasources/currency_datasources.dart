import 'package:dio/dio.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/currency/data/model/currency_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CurrencyDatasources {
  final Dio dio;

  CurrencyDatasources({
    required this.dio,
  });

  Future<List<CurrencyModel>> getCurrency() async {
    print('Attempting to fetch currency data...');
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection. Returning cached data.');
        return getCachedCurrencyData();
      }

      final response = await dio.get(
        baseUrl,
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5), 
        ),
      );

      if (response.statusCode == 200) {
        print('Data fetched successfully from API.');
        return (response.data as List)
            .map((element) => CurrencyModel.fromJson(element))
            .toList();
      } else {
        print('Unexpected status code: ${response.statusCode}');
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API request: $e');
      return getCachedCurrencyData();
    }
  }

  List<CurrencyModel> getCachedCurrencyData() {
    print('Returning cached currency data.');
    return [
      CurrencyModel(
        title: 'XAAUSD',
        code: 'XAA',
        cb_price: '12345',
        date: '2024-12-30',
      ),
    ];
  }
}
