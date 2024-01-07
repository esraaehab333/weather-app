import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  //بكتب جوه اللوجيك عشان يكون عارف يربط بال ui بعد كاد
   WeatherModel? weathermodel;
  getWeather({required String value}) async {
    try {
      weathermodel =
          await WeatherService(Dio()).getCurrentWeather(cityName: value);
      emit(WeatherLoadedState(weathermodel: weathermodel!));
    } catch (e) {
      // الاستيت اللي فيها مشكله بقا
      emit(WeatherFailure(errMessage: e.toString()));
    }
  }
}
