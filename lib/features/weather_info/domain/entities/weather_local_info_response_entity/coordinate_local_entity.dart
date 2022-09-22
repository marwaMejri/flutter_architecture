import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/coordinate_entity.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../../core/utils/mapper/data_mapper.dart';

@Entity()
class CoordinateLocalEntity extends DataMapper<CoordinateEntity> {
  CoordinateLocalEntity({
    this.lon,
    this.lat,
    this.id,
  });

  int? id;
  double? lon;
  double? lat;

  @override
  CoordinateEntity mapToModel() {
    return CoordinateEntity(
      lat: lat,
      lon: lon,
    );
  }
}
