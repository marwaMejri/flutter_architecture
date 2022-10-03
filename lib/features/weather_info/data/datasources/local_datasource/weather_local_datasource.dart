import '../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import '../../models/weather_info_remote_response_model/weather_info_response_model.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherInfoEntity?> getLastWeatherInfo();

  void cacheWeatherInfo(
      WeatherInfoResponseModel? weatherInfoResponseModel);
}
