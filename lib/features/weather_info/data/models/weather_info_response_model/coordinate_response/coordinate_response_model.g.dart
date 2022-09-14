// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateResponseModel _$CoordinateResponseModelFromJson(
        Map<String, dynamic> json) =>
    CoordinateResponseModel(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateResponseModelToJson(
        CoordinateResponseModel instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
