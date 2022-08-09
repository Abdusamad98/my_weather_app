import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/api/models/current/weather_item_data.dart';

part 'hourly_item.g.dart';

// "dt": 1659945600,
// "temp": 29.06,
// "feels_like": 33.44,
// "pressure": 1010,
// "humidity": 73,
// "dew_point": 23.73,
// "uvi": 0.71,
// "clouds": 54,
// "visibility": 10000,
// "wind_speed": 4.81,
// "wind_deg": 232,
// "wind_gust": 8.9,
//"pop": 0.2

@JsonSerializable(explicitToJson: true)
class HourlyItem {
  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;
  @JsonKey(defaultValue: 0.0, name: 'temp')
  double temp;

  @JsonKey(defaultValue: 0.0, name: 'feels_like')
  double feelsLike;

  @JsonKey(defaultValue: 0, name: 'pressure')
  int pressure;

  @JsonKey(defaultValue: 0, name: 'humidity')
  int humidity;

  @JsonKey(defaultValue: 0.0, name: 'dew_point')
  double dewPoint;

  @JsonKey(defaultValue: 0.0, name: 'uvi')
  double uvi;

  @JsonKey(defaultValue: 0, name: 'clouds')
  int clouds;

  @JsonKey(defaultValue: 0, name: 'visibility')
  int visibility;

  @JsonKey(defaultValue: 0.0, name: 'wind_speed')
  double windSpeed;

  @JsonKey(defaultValue: 0, name: 'wind_deg')
  int windDeg;

  @JsonKey(defaultValue: 0.0, name: 'wind_gust')
  double windGust;

  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherItemData> weather;

  @JsonKey(defaultValue: 0.0, name: 'pop')
  double pop;

  HourlyItem({
    required this.weather,
    required this.visibility,
    required this.dt,
    required this.clouds,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.pop,
    required this.dewPoint,
    required this.uvi,
    required this.windDeg,
    required this.windGust,
    required this.windSpeed,
  });

  factory HourlyItem.fromJson(Map<String, dynamic> json) =>
      _$HourlyItemFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyItemToJson(this);

  @override
  String toString() {
    return '''
     dt: $dt,
     temp: $temp
     feelsLike: $feelsLike
     pressure: $pressure
     humidity: $humidity
     dew_point: $dewPoint
     uvi: $uvi
     clouds: $clouds
     windSpeed: $windSpeed
     windDeg: $windDeg
     windGust: $windGust
     weather: ${weather.toString()}
    ''';
  }
}
