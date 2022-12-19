import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class SunsetSunriseLocalEntity extends DataMapper<SunsetSunriseEntity> {
  SunsetSunriseLocalEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  int? type;
  int? id;
  String? country;
  String? sunrise;
  String? sunset;

  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
      sunset: sunset,
      country: country,
      type: type,
      sunrise: sunrise,
      id: id,
    );
  }
}
