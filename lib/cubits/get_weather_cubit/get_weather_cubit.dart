import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Models/weather_model.dart';
import 'package:weather/Services/weather_service.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  void getWeather(String city) async {
    try {
      weatherModel = await WeatherService().getWeather(city);
      emit(WeatherLoadedState(weatherModel!));
    } on DioException catch (e) {
      emit(WeatherErrorState(e.message!));
    } catch (_) {
      emit(WeatherErrorState('oops there was an error, try later'));
    }
  }
}
