import 'package:weather/Models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weather);
  WeatherModel weather;
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState(this.errorMessage);
  String errorMessage;
}
