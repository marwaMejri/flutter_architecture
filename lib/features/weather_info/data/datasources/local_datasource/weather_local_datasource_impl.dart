import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/local_database.dart';
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/clouds_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/main_weather_info_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/sunset_sunrise_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_description_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_local_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_theme_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/wind_info_local_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherLocalDataSource)
class WeatherRemoteDataSourceImpl implements WeatherLocalDataSource {
  WeatherRemoteDataSourceImpl(this.appLocalDatabase);

  final AppLocalDatabase appLocalDatabase;

  @override
  void cacheWeatherInfo(WeatherInfoResponseModel? weatherInfoResponseModel) {
    final WeatherInfoEntity? weatherData =
        weatherInfoResponseModel?.mapToEntity();
    final WeatherInfoLocalEntity _localEntity = WeatherInfoLocalEntity(
      timezone: weatherData?.timezone,
      name: weatherData?.name,
      dt: weatherData?.dt,
      visibility: weatherData?.visibility,
    );
    _localEntity.sys.target = SunsetSunriseLocalEntity(
      sunset: weatherData?.sys?.sunset,
      country: weatherData?.sys?.country,
      type: weatherData?.sys?.type,
      sunrise: weatherData?.sys?.sunrise,
    );
    _localEntity.weather.addAll(
      <WeatherDescriptionLocalEntity>[
        WeatherDescriptionLocalEntity(
          main: weatherData?.weather?[0]?.main,
          icon: weatherData?.weather?[0]?.icon,
          description: weatherData?.weather?[0]?.description,
        ),
      ],
    );
    _localEntity.main.target = MainWeatherInfoLocalEntity(
      tempMin: weatherData?.main?.tempMin,
      tempMax: weatherData?.main?.tempMax,
      pressure: weatherData?.main?.pressure,
      humidity: weatherData?.main?.humidity,
      feelsLike: weatherData?.main?.feelsLike,
      temp: weatherData?.main?.temp,
    );
    _localEntity.wind.target = WindInfoLocalEntity(
      speed: weatherData?.wind?.speed,
      deg: weatherData?.wind?.deg,
    );
    _localEntity.clouds.target = CloudsLocalEntity(
      all: weatherData?.clouds?.all,
    );
    _localEntity.weatherTheme.target = WeatherThemeLocalEntity(
      firstColorHex: weatherData?.weatherTheme?.firstColor?.value,
      secondColorHex: weatherData?.weatherTheme?.secondColor?.value,
    );
    appLocalDatabase.insert<WeatherInfoLocalEntity>(_localEntity);
  }

  @override
  Future<WeatherInfoEntity?> getLastWeatherInfo() async {
    final List<WeatherInfoLocalEntity>? weatherInfoLocalData =
        await appLocalDatabase.getAll<WeatherInfoLocalEntity>();
    if ((weatherInfoLocalData?.length ?? 0) > 0) {
      final WeatherInfoEntity? _lastInfoData =
          weatherInfoLocalData?.last.mapToEntity();
      return _lastInfoData;
    }
    return null;
  }

  @override
  Future<List<WeatherInfoEntity?>?> getAllLocalWeathers() async {
    final List<WeatherInfoLocalEntity>? weatherInfoLocalData =
        await appLocalDatabase.getAll<WeatherInfoLocalEntity>();
    if ((weatherInfoLocalData?.length ?? 0) > 0) {
      final List<WeatherInfoEntity?>? _localData = weatherInfoLocalData
          ?.map((WeatherInfoLocalEntity element) => element.mapToEntity())
          .toList();
      return _localData;
    }
    return null;
  }
}
