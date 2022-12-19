import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_theme_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';

class WeatherInfoEntity extends Equatable {
  const WeatherInfoEntity({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.weatherTheme,
  });
  final List<WeatherDescriptionEntity?>? weather;
  final MainWeatherInfoEntity? main;
  final String? visibility;
  final WindInfoEntity? wind;
  final CloudsEntity? clouds;
  final String? dt;
  final SunsetSunriseEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final WeatherThemeEntity? weatherTheme;

  @override
  List<Object?> get props => <Object?>[
        weather,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        weatherTheme,
      ];
}
