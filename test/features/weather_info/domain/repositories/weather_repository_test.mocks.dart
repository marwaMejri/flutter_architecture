// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_architecture/test/features/weather_info/domain/repositories/weather_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart'
    as _i2;
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart'
    as _i5;
import 'package:flutter_architecture/features/weather_info/utils/requests_models/weather_by_coordinates_request_model.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

import 'weather_repository_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiResultModel_0<T> extends _i1.SmartFake
    implements _i2.ApiResultModel<T> {
  _FakeApiResultModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockWeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockWeatherRepository extends _i1.Mock
    implements _i3.MockWeatherRepository {
  MockMockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>>
      getWeatherDataByCoordinates(
              {_i6.WeatherByCoordinatesRequestModel?
                  weatherByCoordinatesRequestModel}) =>
          (super.noSuchMethod(
            Invocation.method(
              #getWeatherDataByCoordinates,
              [],
              {
                #weatherByCoordinatesRequestModel:
                    weatherByCoordinatesRequestModel
              },
            ),
            returnValue:
                _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>>.value(
                    _FakeApiResultModel_0<_i5.WeatherInfoEntity?>(
              this,
              Invocation.method(
                #getWeatherDataByCoordinates,
                [],
                {
                  #weatherByCoordinatesRequestModel:
                      weatherByCoordinatesRequestModel
                },
              ),
            )),
          ) as _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>>);
  @override
  _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>> getWeatherDataByCity(
          {String? cityName}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWeatherDataByCity,
          [],
          {#cityName: cityName},
        ),
        returnValue:
            _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>>.value(
                _FakeApiResultModel_0<_i5.WeatherInfoEntity?>(
          this,
          Invocation.method(
            #getWeatherDataByCity,
            [],
            {#cityName: cityName},
          ),
        )),
      ) as _i4.Future<_i2.ApiResultModel<_i5.WeatherInfoEntity?>>);
  @override
  _i4.Future<_i2.ApiResultModel<List<_i5.WeatherInfoEntity?>?>>
      getAllLocalWeathers() => (super.noSuchMethod(
            Invocation.method(
              #getAllLocalWeathers,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.ApiResultModel<List<_i5.WeatherInfoEntity?>?>>.value(
                _FakeApiResultModel_0<List<_i5.WeatherInfoEntity?>?>(
              this,
              Invocation.method(
                #getAllLocalWeathers,
                [],
              ),
            )),
          ) as _i4.Future<_i2.ApiResultModel<List<_i5.WeatherInfoEntity?>?>>);
}
