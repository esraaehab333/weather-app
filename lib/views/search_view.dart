// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            /*onChanged: (value) => {
              // هي بتطبع كل تغيير بيتكتب كل كره 
            },*/
            onSubmitted: (value) async {
              //بتتفعل لما بتضغط علي سبمت
              // هيتنفذ علي مره واحده
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getWeather(value: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20.0),
              hintText: "Enter the city you want",
              labelText: "Search",
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green)),
              // دا عشان ياخد شكل البوردر كله
              // suffix اللي ورا
              // perfix اللي قدام
            ),
          ),
        ),
      ),
    );
  }
}
