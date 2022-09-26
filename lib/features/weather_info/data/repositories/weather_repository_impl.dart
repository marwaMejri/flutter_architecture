import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart';
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_by_coordinates_request_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> _result =
          await remoteDataSource.getWeatherDataByCity(cityName: cityName);
      return _result.when(
        success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
          if (weatherInfoResponseModel != null) {
            await _cacheLocalData(weatherInfoResponseModel);
          }
          return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToModel(),
          );
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel,
          );
        },
      );
    } on CustomConnectionException catch (_) {
      return await _getLocalWeatherInfo();
    }
  }

  Future<ApiResultModel<WeatherInfoEntity?>> _getLocalWeatherInfo() async {
    final WeatherInfoEntity? _localResult =
        await localDataSource.getLastWeatherInfo();
    return ApiResultModel<WeatherInfoEntity?>.success(
      data: _localResult,
    );
  }

  @override
  Future<ApiResultModel<WeatherInfoEntity?>> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel? weatherByCoordinatesRequestModel}) async {
    try {
      final ApiResultModel<WeatherInfoResponseModel?> _result =
          await remoteDataSource.getWeatherDataByCoordinates(
              weatherByCoordinatesRequestModel: weatherByCoordinatesRequestModel);
      return _result.when(
        success: (WeatherInfoResponseModel? weatherInfoResponseModel) async {
          if (weatherInfoResponseModel != null) {
            await _cacheLocalData(weatherInfoResponseModel);
          }
          return ApiResultModel<WeatherInfoEntity?>.success(
            data: weatherInfoResponseModel?.mapToModel(),
          );
        },
        failure: (ErrorResultModel errorResultModel) {
          return ApiResultModel<WeatherInfoEntity>.failure(
            errorResultEntity: errorResultModel,
          );
        },
      );
    } on CustomConnectionException catch (_) {
      return await _getLocalWeatherInfo();
    }
  }

  Future<void> _cacheLocalData(WeatherInfoResponseModel? weatherData) async {
    await localDataSource.cacheWeatherInfo(weatherData);
  }
}