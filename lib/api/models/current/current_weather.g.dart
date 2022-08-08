// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      sys: CurrentWeatherSys.fromJson(json['sys'] as Map<String, dynamic>),
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      base: json['base'] as String? ?? '',
      clouds:
          CurrentWeatherClouds.fromJson(json['clouds'] as Map<String, dynamic>),
      cod: json['cod'] as int? ?? 0,
      coord: CoordData.fromJson(json['coord'] as Map<String, dynamic>),
      dt: json['dt'] as int? ?? 0,
      timezone: json['timezone'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      main: CurrentWeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherItemData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      wind: CurrentWeatherWind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
