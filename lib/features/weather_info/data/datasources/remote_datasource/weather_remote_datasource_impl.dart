import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/api_call_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/string_extension_functions.dart';
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:http/http.dart';

import '../../models/weather_info_remote_response_model/weather_info_response_model.dart';

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._apiCallHelper);

  final ApiCallHelper _apiCallHelper;

  @override
  Future<ApiResultModel<WeatherInfoResponseModel?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper.getWS(
          uri: getWeatherDetails,
          params: <String, dynamic>{
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
      {double? lat, double? lon}) async {
    try {
      final ApiResultModel<Response> _result = await _apiCallHelper
          .getWS(uri: getWeatherDetails, params: <String, dynamic>{
        latitudeKey: lat,
        longitudeKey: lon,
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
