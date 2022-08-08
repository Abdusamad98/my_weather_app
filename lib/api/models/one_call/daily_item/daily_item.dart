import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/current/weather_item_data.dart';
import 'package:my_weather_app/api/models/one_call/daily_item/daily_feels_like.dart';
import 'package:my_weather_app/api/models/one_call/daily_item/daily_temp.dart';

part 'daily_item.g.dart';

// "dt": 1659924000,
// "sunrise": 1659902296,
// "sunset": 1659951673,
// "moonrise": 1659939900,
// "moonset": 1659885060,
// "moon_phase": 0.35,
// "temp": {
// },
// "feels_like": {
// },
// "pressure": 1012,
// "humidity": 63,
// "dew_point": 22.46,
// "wind_speed": 5.54,
// "wind_deg": 250,
// "wind_gust": 9.71,
// "weather": [
// ],
// "clouds": 22,
// "pop": 0.52,
// "uvi": 9.96

@JsonSerializable(explicitToJson: true)
class DailyItem {
  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunset;

  @JsonKey(defaultValue: 0, name: 'moonrise')
  int moonrise;

  @JsonKey(defaultValue: 0, name: 'moonset')
  int moonset;

  @JsonKey(defaultValue: 0.0, name: 'moon_phase')
  double moonPhase;

  @JsonKey(name: 'temp')
  DailyTemp dailyTemp;

  @JsonKey(name: 'feels_like')
  DailyFeelsLike dailyFeelsLike;

  @JsonKey(defaultValue: 0, name: 'pressure')
  int pressure;

  @JsonKey(defaultValue: 0, name: 'humidity')
  int humidity;

  @JsonKey(defaultValue: 0.0, name: 'dew_point')
  double dewPoint;

  @JsonKey(defaultValue: 0.0, name: 'wind_speed')
  double windSpeed;

  @JsonKey(defaultValue: 0, name: 'wind_deg')
  int windDeg;

  @JsonKey(defaultValue: 0.0, name: 'wind_gust')
  double windGust;


  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherItemData> weather;

  @JsonKey(defaultValue: 0, name: 'clouds')
  int clouds;

  @JsonKey(defaultValue: 0.0, name: 'pop')
  double pop;

  @JsonKey(defaultValue: 0.0, name: 'uvi')
  double uvi;

  DailyItem({
    required this.dailyFeelsLike,
    required this.dailyTemp,
    required this.windSpeed,
    required this.windGust,
    required this.windDeg,
    required this.uvi,
    required this.dewPoint,
    required this.pop,
    required this.humidity,
    required this.clouds,
    required this.pressure,
    required this.dt,
    required this.weather,
    required this.sunset,
    required this.sunrise,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
  });

  factory DailyItem.fromJson(Map<String, dynamic> json) =>
      _$DailyItemFromJson(json);

  Map<String, dynamic> toJson() => _$DailyItemToJson(this);
}
