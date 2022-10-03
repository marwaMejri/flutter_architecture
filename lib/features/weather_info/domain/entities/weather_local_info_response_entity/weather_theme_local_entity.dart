import 'dart:ui';
import 'package:objectbox/objectbox.dart';

import '../../../../../core/utils/mapper/data_mapper.dart';
import '../weather_remote_info_response_entity/weather_theme_entity.dart';

@Entity()
class WeatherThemeLocalEntity extends DataMapper<WeatherThemeEntity> {
  int? firstColorHex;
  int? secondColorHex;
  int? id;

  WeatherThemeLocalEntity({
    this.firstColorHex,
    this.secondColorHex,
    this.id,
  });

  @override
  WeatherThemeEntity mapToModel() {
    return WeatherThemeEntity(
      secondColor: Color(secondColorHex ?? 0),
      firstColor: Color(firstColorHex ?? 0),
    );
  }
}
