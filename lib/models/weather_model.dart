// انا الاول بعمل الموديل عشان السيرفير محتاجه
// موديل تشتغل عليه ف عشان مقطعش نفسي ف النص اعملها من الاول
class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  //نفترض علي طول ان البيانات
  //وارد انها تيجي ب null عادي
  // لو هي مش نالابول يبقي لازم تكون required
  //لازم نشوف الداتا تايب اللي ف الريسبونس اي عشان مش تديب اكسيبشن

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherCondition});
  // بس بشي منطقي انها مستحيل يرجعلي ب null
  factory WeatherModel.fromJson(Map<String,dynamic>json) { 
    return WeatherModel(
        cityName: json["location"]["name"],
        date:DateTime.parse( json["current"]["last_updated"]),
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
         image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"]);
  }
}