import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CloudsLocalEntity extends DataMapper<CloudsEntity> {
  CloudsLocalEntity({
    this.all,
    this.id,
  });

  int? all;
  int? id;

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(
      all: all,
    );
  }
}
