// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherMain _$CurrentWeatherMainFromJson(Map<String, dynamic> json) =>
    CurrentWeatherMain(
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      grndLevel: json['grnd_level'] as int? ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      pressure: json['pressure'] as int? ?? 0,
      seaLevel: json['sea_level'] as int? ?? 0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CurrentWeatherMainToJson(CurrentWeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'humidity': instance.humidity,
      'grnd_level': instance.grndLevel,
    };
