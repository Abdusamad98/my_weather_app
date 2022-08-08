import 'package:json_annotation/json_annotation.dart';

part 'current_weather_sys.g.dart';

// "country": "UZ",
// "sunrise": 1659918424,
// "sunset": 1659969211

@JsonSerializable(explicitToJson: true)
class CurrentWeatherSys {
  @JsonKey(defaultValue: "", name: 'country')
  String country;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunset;

  CurrentWeatherSys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory CurrentWeatherSys.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherSysFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherSysToJson(this);
}
