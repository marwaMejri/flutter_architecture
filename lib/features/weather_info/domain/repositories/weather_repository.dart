import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_info_response_entity/weather_info_entity.dart';

abstract class WeatherRepository {
  Future<ApiResultModel<WeatherInfoEntity>> getWeatherDataByCoordinates(
      {double? lat, double? lon});

  Future<ApiResultModel<WeatherInfoEntity>> getWeatherDataByCity(
      {String? cityName});
}
