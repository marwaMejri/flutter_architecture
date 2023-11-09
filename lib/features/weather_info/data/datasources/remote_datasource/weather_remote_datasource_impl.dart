import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/concrete_strategies/get_request_strategy.dart';
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_context.dart';
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/utils/requests_models/weather_by_coordinates_request_model.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._apiCallHelper);

  final HttpRequestContext _apiCallHelper;

  @override
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.makeRequest(
          httpRequestStrategy: GetRequestStrategy(),
          uri: getWeatherDetails,
          requestData: <String, dynamic>{
            cityNameKey: cityName,
            appIdKey: appIdValue
          });
      return _result.when(
        success: (Response response) {
          return ApiResultModel<WeatherInfoResponseModel?>.success(
            data: WeatherInfoResponseModel.fromJson(
              response.decodeJson(),
            ),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<WeatherInfoResponseModel?>.failure(
              errorResultEntity: errorModel);
        },
      );
    } on CustomConnectionException catch (exception) {
      throw CustomConnectionException(
        exceptionMessage: exception.exceptionMessage,
        exceptionCode: exception.exceptionCode,
      );
    }
  }

  @override
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCoordinates(
      {WeatherByCoordinatesRequestModel?
          weatherByCoordinatesRequestModel}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.makeRequest(
          httpRequestStrategy: GetRequestStrategy(),
          uri: getWeatherDetails,
          requestData: <String, dynamic>{
            latitudeKey: weatherByCoordinatesRequestModel?.lat,
            longitudeKey: weatherByCoordinatesRequestModel?.lon,
            appIdKey: appIdValue,
          });
      return _result.when(
        success: (Response response) {
          return ApiResultModel<WeatherInfoResponseModel?>.success(
            data: WeatherInfoResponseModel.fromJson(
              response.decodeJson(),
            ),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<WeatherInfoResponseModel?>.failure(
              errorResultEntity: errorModel);
        },
      );
    } on CustomConnectionException catch (exception) {
      throw CustomConnectionException(
        exceptionMessage: exception.exceptionMessage,
        exceptionCode: exception.exceptionCode,
      );
    }
  }
}
