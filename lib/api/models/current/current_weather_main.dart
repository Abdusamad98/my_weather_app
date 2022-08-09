import 'package:json_annotation/json_annotation.dart';

part 'current_weather_main.g.dart';

// "temp": 311.27,
// "feels_like": 308.7,
// "temp_min": 311.27,
// "temp_max": 311.27,
// "pressure": 1003,
// "humidity": 13,
// "sea_level": 1003,
// "grnd_level": 971

@JsonSerializable(explicitToJson: true)
class CurrentWeatherMain {
  @JsonKey(defaultValue: 0.0, name: 'temp')
  double temp;

  @JsonKey(defaultValue: 0.0, name: 'feels_like')
  double feelsLike;

  @JsonKey(defaultValue: 0.0, name: 'temp_min')
  double tempMin;

  @JsonKey(defaultValue: 0.0, name: 'temp_max')
  double tempMax;

  @JsonKey(defaultValue: 0, name: 'pressure')
  int pressure;

  @JsonKey(defaultValue: 0, name: 'sea_level')
  int seaLevel;

  @JsonKey(defaultValue: 0, name: 'humidity')
  int humidity;

  @JsonKey(defaultValue: 0, name: 'grnd_level')
  int grndLevel;

  CurrentWeatherMain({
    required this.feelsLike,
    required this.grndLevel,
    required this.humidity,
    required this.pressure,
    required this.seaLevel,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
  });

  factory CurrentWeatherMain.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherMainToJson(this);

  // "temp": 311.27,
// "feels_like": 308.7,
// "temp_min": 311.27,
// "temp_max": 311.27,
// "pressure": 1003,
// "humidity": 13,
// "sea_level": 1003,
// "grnd_level": 971

  @override
  String toString() {
    return '''
 temp: $temp,
 feels_like: $feelsLike,
 temp_min: $tempMin,
 temp_max: $tempMax,
 pressure: $pressure,
 humidity: $humidity,
 sea_level: $seaLevel,
 grnd_level": $grndLevel
    ''';
  }
}
