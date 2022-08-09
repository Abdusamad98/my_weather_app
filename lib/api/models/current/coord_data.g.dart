// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordData _$CoordDataFromJson(Map<String, dynamic> json) => CoordData(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CoordDataToJson(CoordData instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
