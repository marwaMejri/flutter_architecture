import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../../core/utils/mapper/data_mapper.dart';

@Entity()
class WindInfoLocalEntity extends DataMapper<WindInfoEntity> {
  WindInfoLocalEntity({
    this.speed,
    this.deg,
    this.id,
  });

  int? id;
  double? speed;
  int? deg;

  @override
  WindInfoEntity mapToModel() {
    return WindInfoEntity(
      deg: deg,
      speed: speed,
    );
  }
}