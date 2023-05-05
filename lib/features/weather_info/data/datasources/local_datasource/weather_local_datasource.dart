import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherInfoEntity?> getLastWeatherInfo();

  Future<List<WeatherInfoEntity?>?> getAllLocalWeathers();

  void cacheWeatherInfo(WeatherInfoResponseModel? weatherInfoResponseModel);
}
