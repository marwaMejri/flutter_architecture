import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_description_response_model.g.dart';

@JsonSerializable()
class WeatherDescriptionResponseModel
    extends DataMapper<WeatherDescriptionEntity> {
  WeatherDescriptionResponseModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDescriptionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionResponseModelFromJson(json);

  final int? id;
  final String? main;
  final String? description;
  final String? icon;


  @override
  WeatherDescriptionEntity mapToEntity() {
    return WeatherDescriptionEntity(
      id: id ?? 0,
      description: description ?? '',
      icon: icon ?? '',
      main: main ?? '',
    );
  }
}
