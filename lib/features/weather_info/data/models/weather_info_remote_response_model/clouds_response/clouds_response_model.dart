import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds_response_model.g.dart';

@JsonSerializable()
class CloudsResponseModel extends DataMapper<CloudsEntity> {
  CloudsResponseModel({
    this.all,
  });

  final int? all;

  factory CloudsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsResponseModelFromJson(json);

  @override
  CloudsEntity mapToModel() {
    return CloudsEntity(
      all: all ?? 0,
    );
  }
}