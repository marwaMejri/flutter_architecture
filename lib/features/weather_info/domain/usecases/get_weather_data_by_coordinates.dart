import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/usecases/base_params_usecase.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_by_coordinates_request_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class GetWeatherDataByCoordinates
    implements
        BaseParamsUseCase<WeatherInfoEntity, WeatherByCoordinatesRequestModel> {
  GetWeatherDataByCoordinates(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<ApiResultModel<WeatherInfoEntity>> call(
      WeatherByCoordinatesRequestModel weatherByCoordinatesRequestModel) {
    return weatherRepository.getWeatherDataByCoordinates(
        lat: weatherByCoordinatesRequestModel.lat,
        lon: weatherByCoordinatesRequestModel.lon);
  }
}