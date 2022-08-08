import 'package:json_annotation/json_annotation.dart';

part 'current_weather_wind.g.dart';

// "speed": 4.26,
// "deg": 261,
// "gust": 7.69

@JsonSerializable(explicitToJson: true)
class CurrentWeatherWind {
  @JsonKey(defaultValue: 0.0, name: 'speed')
  double speed;

  @JsonKey(defaultValue: 0, name: 'deg')
  int deg;

  @JsonKey(defaultValue: 0.0, name: 'gust')
  double gust;

  CurrentWeatherWind({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  factory CurrentWeatherWind.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherWindFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherWindToJson(this);
}
