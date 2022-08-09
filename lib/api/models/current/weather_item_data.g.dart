// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherItemData _$WeatherItemDataFromJson(Map<String, dynamic> json) =>
    WeatherItemData(
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      main: json['main'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherItemDataToJson(WeatherItemData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
