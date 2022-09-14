import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_info_response_entity/coordinate_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coordinate_response_model.g.dart';

@JsonSerializable()
class CoordinateResponseModel extends DataMapper<CoordinateEntity> {
  CoordinateResponseModel({
    this.lon,
    this.lat,
  });

  final double? lon;
  final double? lat;

  factory CoordinateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateResponseModelFromJson(json);

  @override
  CoordinateEntity mapToDomainModel() {
    return CoordinateEntity(
      lat: lat ?? 0.0,
      lon: lon ?? 0.0,
    );
  }
}
