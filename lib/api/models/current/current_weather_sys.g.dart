// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherSys _$CurrentWeatherSysFromJson(Map<String, dynamic> json) =>
    CurrentWeatherSys(
      country: json['country'] as String? ?? '',
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
    );

Map<String, dynamic> _$CurrentWeatherSysToJson(CurrentWeatherSys instance) =>
    <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
