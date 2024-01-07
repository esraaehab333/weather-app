import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather/views/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weathermodel
                          ?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  // Grouped conditions
  if (condition == null) return Colors.cyan;
  if (condition == "Sunny" || condition == "Clear")
    return Colors.orange;
  else if (condition == "Partly cloudy" ||
      condition == "Cloudy" ||
      condition == "Overcast")
    return Colors.grey;
  else if (condition == "Mist" ||
      condition == "Fog" ||
      condition == "Freezing fog")
    return Colors.blueGrey;
  else if (condition == "Patchy rain possible" ||
      condition == "Patchy light drizzle" ||
      condition == "Light drizzle" ||
      condition == "Patchy light rain" ||
      condition == "Light rain" ||
      condition == "Moderate rain at times" ||
      condition == "Moderate rain" ||
      condition == "Heavy rain at times" ||
      condition == "Heavy rain" ||
      condition == "Light freezing rain" ||
      condition == "Moderate or heavy freezing rain" ||
      condition == "Light sleet" ||
      condition == "Moderate or heavy sleet" ||
      condition == "Patchy light snow" ||
      condition == "Light snow" ||
      condition == "Patchy moderate snow" ||
      condition == "Moderate snow" ||
      condition == "Patchy heavy snow" ||
      condition == "Heavy snow" ||
      condition == "Ice pellets" ||
      condition == "Light rain shower" ||
      condition == "Moderate or heavy rain shower" ||
      condition == "Torrential rain shower" ||
      condition == "Light sleet showers" ||
      condition == "Moderate or heavy sleet showers" ||
      condition == "Light snow showers" ||
      condition == "Moderate or heavy snow showers" ||
      condition == "Light showers of ice pellets" ||
      condition == "Moderate or heavy showers of ice pellets") {
    return Colors.lightBlue;
  } else if (condition == "Patchy freezing drizzle possible" ||
      condition == "Patchy snow possible" ||
      condition == "Patchy sleet possible" ||
      condition == "Blowing snow" ||
      condition == "Blizzard") {
    return Colors.amber;
  } else if (condition == "Thundery outbreaks possible" ||
      condition == "Patchy light rain with thunder" ||
      condition == "Moderate or heavy rain with thunder" ||
      condition == "Patchy light snow with thunder" ||
      condition == "Moderate or heavy snow with thunder") {
    return Colors.deepPurple;
  }

  // Default color if condition doesn't match any of the above
  return Colors.grey;
}
