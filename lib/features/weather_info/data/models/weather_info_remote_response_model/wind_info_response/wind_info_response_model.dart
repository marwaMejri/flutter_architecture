import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind_info_response_model.g.dart';

@JsonSerializable()
class WindInfoResponseModel extends DataMapper<WindInfoEntity> {
  WindInfoResponseModel({
    this.speed,
    this.deg,
  });

  factory WindInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WindInfoResponseModelFromJson(json);
  final double? speed;
  final int? deg;


  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(
      deg: deg ?? 0,
      speed: speed?.toWindSpeed() ?? '',
    );
  }
}
