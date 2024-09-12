class WeatherModel {
  final String cityName;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String time;
  final String weatherIcon;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.time,
      required this.weatherIcon,
      required this.condition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      time: json['current']['last_updated'].split(' ')[1],
      temp: json['current']['temp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherIcon: 'https:${json['current']['condition']['icon']}',
      condition: json['current']['condition']['text'],
    );
  }
}
