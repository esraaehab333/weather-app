import 'package:weather/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weathermodel;

  WeatherLoadedState({required this.weathermodel});
}

class WeatherFailure extends WeatherState {
  final String errMessage;

  WeatherFailure( {required this.errMessage});
}
