import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherCubit>(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                  appBarTheme: AppBarTheme(
                      color: getThemeColor(
                          BlocProvider.of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.condition))),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
      return Colors.blue;
    case 'Overcast':
    case 'Mist':
    case 'Fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy freezing drizzle':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy freezing rain':
    case 'Moderate or heavy sleet':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Freezing drizzle':
    case 'Light drizzle':
    case 'Light rain':
    case 'Light snow':
    case 'Light sleet':
    case 'Light freezing rain':
    case 'Light sleet showers':
    case 'Light snow showers':
    case 'Light showers of ice pellets':
      return Colors.lightBlue;
    default:
      return Colors.grey;
  }
}
