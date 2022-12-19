import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/clouds_response/clouds_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/coordinate_response/coordinate_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/main_weather_info_response/main_weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/sunset_sunrise_response/sunset_sunrise_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_description_response/weather_description_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/wind_info_response/wind_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/repositories/weather_repository_impl.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../datasources/weather_local_datasource_test/weather_datasources_test.dart';
import '../datasources/weather_remote_datasource_test/weather_datasources_mock.mocks.dart';

void main() {
  late WeatherRepositoryImpl _sut;
  late MockRemoteDataSource _remoteDatasource;
  late MockWeatherLocalDataSource _localDatasource;
  setUp(
    () {
      _remoteDatasource = MockRemoteDataSource();
      _localDatasource = MockWeatherLocalDataSource();
      _sut = WeatherRepositoryImpl(
        remoteDataSource: _remoteDatasource,
        localDataSource: _localDatasource,
      );
    },
  );
  group('test getWeatherDataByCoordinates() when device offline', () {
    const String _cityName = 'Sousse';
    final WeatherInfoResponseModel _weatherInfoResponseModel =
        WeatherInfoResponseModel(
      date: 1663066385,
      sunsetAndSunriseData: SunsetSunriseResponseModel(
        country: 'TN',
        id: 1193,
        type: 1,
        sunrise: 1663045105,
        sunset: 1663090127,
      ),
      timezone: 3600,
      id: 2464915,
      cityName: 'Sousse',
      mainWeatherData: MainWeatherInfoResponseModel(
        temp: 304.03,
        feelsLike: 307.27,
        tempMin: 303.02,
        tempMax: 304.03,
        pressure: 1014,
        humidity: 58,
      ),
      windData: WindInfoResponseModel(speed: 5.66, deg: 100),
      weatherVisibility: 10000,
      cloudsData: CloudsResponseModel(
        all: 20,
      ),
      weatherDescription: <WeatherDescriptionResponseModel>[
        WeatherDescriptionResponseModel(
          id: 801,
          main: 'Clouds',
          description: 'few clouds',
          icon: '02d',
        ),
      ],
      coordinateData: CoordinateResponseModel(lon: 10.637, lat: 35.8254),
    );
    void _arrangeResponse() {
      when(_remoteDatasource.getWeatherDataByCity(cityName: _cityName))
          .thenAnswer((_) async {
        return ApiResultModel<WeatherInfoResponseModel?>.success(
            data: _weatherInfoResponseModel);
      });
    }

    test(
      'should return correct data',
      () async {
        //arrange
        _arrangeResponse();
        //act
        final ApiResultModel<WeatherInfoEntity?> result =
            await _sut.getWeatherDataByCity(cityName: _cityName);
        //assert
        expect(
          result,
          ApiResultModel<WeatherInfoEntity?>.success(
              data: _weatherInfoResponseModel.mapToEntity()),
        );
      },
    );
  });
}
