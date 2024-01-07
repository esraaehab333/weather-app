
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final apiKey = "4063fcfe6e6f4553bb5111347230612";

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      // تسلمي فهمت شئ 
      // مشرحتش اصلا و هو غبي اصلا بس اوكاي 
      // هقوم اكل و ابدا بيج داتا 👍
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return weatherModel; //معملش هنا ريترن حلو
      // يعني معني كدا المشكله هنا برضوا
      //المفروض بقا انه مش يعترض عليها احنا غيرناها زي مهو عاوزها صح
      // مش دخل فيها برضوا يبقي المشكله ف ال weathermodel
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data["error"]["message"] ?? "oops threr was an error ";
      // ممكن يرجع ب null ف جايبلي ايرور
      // علامه التعجيب انا هنا بقوله اكيد الرسبونس مش ب null
      // و ممكن يرجعلي ب null عادي مش هكتيبها
      // ? خلي بالك لو مش ب null اكسسلي المسدج لو ب null مش تعمل حاجه
      print(errMessage);
      throw Exception(errMessage);
      // (Map<String,dynamic>) .... true
      // (String)... false
      // Hint😊 والله
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
