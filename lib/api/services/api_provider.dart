import 'dart:convert';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/api/models/task_data.dart';
import 'package:my_weather_app/utils/constants.dart';

class ApiProvider {
  /// Simple weather data CURRENT
  static Future<CurrentWeather> getCurrentWeatherByText({
    required String searchText,
  }) async {
    try {
      var queryParams = {
        "appid": API_KEY,
        "q": searchText,
      };
      Response response = await https.get(
        Uri.https(BASE_URL, "/data/2.5/weather", queryParams),
      );
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

  static Future<CurrentWeather> getCurrentWeatherByLatLong({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var queryParams = {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": API_KEY,
      };
      Response response = await https.get(
        Uri.https(BASE_URL, "/data/2.5/weather", queryParams),
      );
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

  /// Daily Hourly and Current weather
  static Future<OneCallData> getOneCallByLatLong({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var queryParams = {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": API_KEY,
        "units": "metric",
        "exclude": "minutely,current",
      };
      Response response = await https.get(
        Uri.https(BASE_URL, "/data/2.5/onecall", queryParams),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var jsonMap = jsonDecode(response.body);
        return OneCallData.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }

  ///  --------------- Task Data -----------------
  static Future<TaskData> getTaskData() async {
    try {
      Response response = await https.get(
        Uri.parse("https://easyenglishuzb.free.mockoapp.net/country/U"),
      );
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return TaskData.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {}
  }
}
