import 'package:json_annotation/json_annotation.dart';

part 'coord_data.g.dart';

// "lon": 68.856,
// "lat": 40.9683

@JsonSerializable(explicitToJson: true)
class CoordData {
  @JsonKey(defaultValue: 0.0, name: 'lat')
  double lat;

  @JsonKey(defaultValue: 0.0, name: 'lon')
  double lon;

  CoordData({
    required this.lat,
    required this.lon,
  });

  factory CoordData.fromJson(Map<String, dynamic> json) =>
      _$CoordDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoordDataToJson(this);

  @override
  String toString() {
    return '''
     latitude: $lat,
     longitude: $lon
    ''';
  }
}
