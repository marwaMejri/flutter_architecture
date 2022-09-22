import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';

import '../../models/weather_info_remote_response_model/weather_info_response_model.dart';

abstract class WeatherRemoteDataSource {
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCoordinates(
      {double? lat, double? lon});

  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCity(
      {String? cityName});
}
