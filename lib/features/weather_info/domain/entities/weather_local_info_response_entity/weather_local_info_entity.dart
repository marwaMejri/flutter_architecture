import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/clouds_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/coordinate_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/main_weather_info_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/sunset_sunrise_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_description_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_theme_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/wind_info_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WeatherInfoLocalEntity extends DataMapper<WeatherInfoEntity> {
  WeatherInfoLocalEntity({
    this.base,
    this.visibility,
    this.dt,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  final ToOne<CoordinateLocalEntity> coord = ToOne<CoordinateLocalEntity>();
  final ToMany<WeatherDescriptionLocalEntity> weather = ToMany<WeatherDescriptionLocalEntity>();
  String? base;
  final ToOne<MainWeatherInfoLocalEntity> main = ToOne<MainWeatherInfoLocalEntity>();
  String? visibility;
  final ToOne<WindInfoLocalEntity> wind = ToOne<WindInfoLocalEntity>();
  final ToOne<CloudsLocalEntity> clouds = ToOne<CloudsLocalEntity>();
  String? dt;
  final ToOne<SunsetSunriseLocalEntity> sys = ToOne<SunsetSunriseLocalEntity>();
  int? timezone;
  int? id;
  @Unique(onConflict: ConflictStrategy.replace)
  String? name;
  int? cod;
  final ToOne<WeatherThemeLocalEntity> weatherTheme = ToOne<WeatherThemeLocalEntity>();

  @override
  WeatherInfoEntity mapToModel() {
    return WeatherInfoEntity(
      base: base,
      cod: cod,
      timezone: timezone,
      id: id,
      weatherTheme: weatherTheme.target?.mapToModel(),
      name: name,
      coord: coord.target?.mapToModel(),
      weather: weather.map((WeatherDescriptionLocalEntity element) => element.mapToModel()).toList(),
      clouds: clouds.target?.mapToModel(),
      dt: dt,
      main: main.target?.mapToModel(),
      visibility: visibility,
      sys: sys.target?.mapToModel(),
      wind: wind.target?.mapToModel(),
    );
  }
}
