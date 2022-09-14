// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_description_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDescriptionResponseModel _$WeatherDescriptionResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherDescriptionResponseModel(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDescriptionResponseModelToJson(
        WeatherDescriptionResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
