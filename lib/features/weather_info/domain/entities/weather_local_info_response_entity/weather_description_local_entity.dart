import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class WeatherDescriptionLocalEntity
    extends DataMapper<WeatherDescriptionEntity> {
  WeatherDescriptionLocalEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  @override
  WeatherDescriptionEntity mapToEntity() {
    return WeatherDescriptionEntity(
      id: id,
      main: main,
      icon: icon,
      description: description,
    );
  }
}
