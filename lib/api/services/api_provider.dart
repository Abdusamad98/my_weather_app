import 'dart:convert';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ApiProvider {
  static Future<CurrentWeather> getOneCallApi() async {
    try {
      Response response = await https.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?appid=139d82d53b7f20c0a44c1bc27377f9ff&q=Olmazor"));
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return CurrentWeather.fromJson(jsonMap);

      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }
}
