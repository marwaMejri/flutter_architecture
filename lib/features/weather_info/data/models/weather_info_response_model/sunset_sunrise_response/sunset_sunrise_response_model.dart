import 'package:flutter_architecture/core/utils/extension_functions/date_extension_functions.dart';
import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_info_response_entity/sunset_sunrise_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sunset_sunrise_response_model.g.dart';

@JsonSerializable()
class SunsetSunriseResponseModel extends DataMapper<SunsetSunriseEntity> {
  SunsetSunriseResponseModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  factory SunsetSunriseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunsetSunriseResponseModelFromJson(json);

  @override
  SunsetSunriseEntity mapToDomainModel() {
    return SunsetSunriseEntity(
      sunrise: sunrise?.fromTimestampToDate() ?? null,
      type: type ?? 0,
      id: id ?? 0,
      country: country ?? '',
      sunset: sunset?.fromTimestampToDate() ?? null,
    );
  }
}
