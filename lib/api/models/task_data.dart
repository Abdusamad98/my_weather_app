import 'package:json_annotation/json_annotation.dart';

part 'task_data.g.dart';

@JsonSerializable(explicitToJson: true)
class TaskData {
  @JsonKey(defaultValue: "", name: 'country_name')
  String countryName;

  @JsonKey(defaultValue: "", name: 'country_code')
  String countryCode;

  @JsonKey(defaultValue: "", name: 'capital')
  String capital;

  @JsonKey(defaultValue: 0, name: 'regioons_count')
  int regionCount;

  @JsonKey(defaultValue: "", name: 'population_count')
  String populationCount;

  @JsonKey(defaultValue: "", name: 'flag_image')
  String flagImage;

  TaskData({
    required this.capital,
    required this.countryCode,
    required this.countryName,
    required this.flagImage,
    required this.populationCount,
    required this.regionCount,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataToJson(this);

  @override
  String toString() {
    return '''
     country_name: $countryName,
    ''';
  }
}
