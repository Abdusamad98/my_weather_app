import 'package:json_annotation/json_annotation.dart';

part 'weather_item_data.g.dart';

// "id": 800,
// "main": "Clear",
// "description": "clear sky",
// "icon": "01d"

@JsonSerializable(explicitToJson: true)
class WeatherItemData {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'main')
  String main;

  @JsonKey(defaultValue: '', name: 'description')
  String description;

  @JsonKey(defaultValue: '', name: 'icon')
  String icon;

  WeatherItemData({
    required this.id,
    required this.description,
    required this.main,
    required this.icon,
  });

  factory WeatherItemData.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherItemDataToJson(this);
}
