import 'package:equatable/equatable.dart';

import 'clouds_entity.dart';
import 'coordinate_entity.dart';
import 'main_weather_info_entity.dart';
import 'sunset_sunrise_entity.dart';
import 'weather_description_entity.dart';
import 'wind_info_entity.dart';

class WeatherInfoEntity extends Equatable {
  WeatherInfoEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  final CoordinateEntity? coord;
  final List<WeatherDescriptionEntity>? weather;
  final String? base;
  final MainWeatherInfoEntity? main;
  final int? visibility;
  final WindInfoEntity? wind;
  final CloudsEntity? clouds;
  final int? dt;
  final SunsetSunriseEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  @override
  List<Object?> get props => <Object?>[
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}
