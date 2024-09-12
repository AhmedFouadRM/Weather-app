import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/Models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '8ae3e93ad5a24eefad9215145240104';
  Future<WeatherModel> getWeather(String city) async {
    try {
      var response =
          await Dio().get('$baseUrl/forecast.json', queryParameters: {
        'key': apiKey,
        'q': city,
      });
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        if (e.response!.statusCode! >= 500) {
          throw DioException(
              message:
                  'there is no internet connection please, check the network and try again',
              requestOptions: e.requestOptions);
        } else if (e.response!.statusCode! >= 400) {
          throw DioException(
              message: e.response!.data['error']['message'],
              requestOptions: e.requestOptions);
        } else {
          throw DioException(
              message: 'oops there was an error, try later',
              requestOptions: e.requestOptions);
        }
      } else {
        throw DioException(
            message: 'oops there was an error, try later',
            requestOptions: e.requestOptions);
      }
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
