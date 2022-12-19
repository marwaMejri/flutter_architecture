// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoResponseModel _$WeatherInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherInfoResponseModel(
      coordinateData: json['coord'] == null
          ? null
          : CoordinateResponseModel.fromJson(
              json['coord'] as Map<String, dynamic>),
      weatherDescription: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDescriptionResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mainWeatherData: json['main'] == null
          ? null
          : MainWeatherInfoResponseModel.fromJson(
              json['main'] as Map<String, dynamic>),
      weatherVisibility: json['visibility'] as int?,
      windData: json['wind'] == null
          ? null
          : WindInfoResponseModel.fromJson(
              json['wind'] as Map<String, dynamic>),
      cloudsData: json['clouds'] == null
          ? null
          : CloudsResponseModel.fromJson(
              json['clouds'] as Map<String, dynamic>),
      date: json['dt'] as int?,
      sunsetAndSunriseData: json['sys'] == null
          ? null
          : SunsetSunriseResponseModel.fromJson(
              json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      cityName: json['name'] as String?,
    );

Map<String, dynamic> _$WeatherInfoResponseModelToJson(
        WeatherInfoResponseModel instance) =>
    <String, dynamic>{
      'coord': instance.coordinateData,
      'weather': instance.weatherDescription,
      'main': instance.mainWeatherData,
      'visibility': instance.weatherVisibility,
      'wind': instance.windData,
      'clouds': instance.cloudsData,
      'dt': instance.date,
      'sys': instance.sunsetAndSunriseData,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.cityName,
    };
