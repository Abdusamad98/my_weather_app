import 'package:json_annotation/json_annotation.dart';

part 'current_weather_clouds.g.dart';

//"all": 0

@JsonSerializable(explicitToJson: true)
class CurrentWeatherClouds {
  @JsonKey(defaultValue: 0, name: 'all')
  int all;

  CurrentWeatherClouds({
    required this.all,
  });

  factory CurrentWeatherClouds.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherCloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherCloudsToJson(this);

  @override
  String toString() {
    return '''
     all: $all,
    ''';
  }

}
