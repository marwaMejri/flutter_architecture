import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart';
import 'package:flutter_architecture/features/weather_info/utils/requests_models/weather_by_coordinates_request_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/weather_repository_test.mocks.dart';

void main() {
  late MockMockWeatherRepository _mockWeatherRepository;
  late GetWeatherDataByCoordinates _sut;
  setUp(() {
    _mockWeatherRepository = MockMockWeatherRepository();
    _sut = GetWeatherDataByCoordinates(_mockWeatherRepository);
  });
  group('test getWeatherDataByCoordinates() use case', () {
    const WeatherInfoEntity _mockedResult = WeatherInfoEntity(
      clouds: CloudsEntity(all: 0),
      weather: <WeatherDescriptionEntity>[
        WeatherDescriptionEntity(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        ),
      ],
    );
    const double lat = 10.0;
    const double lon = 50.0;
    void _arrangeResponse() {
      when(_mockWeatherRepository.getWeatherDataByCoordinates(
        weatherByCoordinatesRequestModel:
            WeatherByCoordinatesRequestModel(lon: lon, lat: lat),
      )).thenAnswer((_) async {
        return const ApiResultModel<WeatherInfoEntity>.success(data: _mockedResult);
      });
    }

    test(
      'should get weather data from the repository with the given coordinates',
      () async {
        //arrange
        _arrangeResponse();
        //act
        final ApiResultModel<WeatherInfoEntity?> result =
            await _sut(WeatherByCoordinatesRequestModel(lon: lon, lat: lat));
        //assert
        expect(
          result,
          const ApiResultModel<WeatherInfoEntity>.success(data: _mockedResult),
        );
        verify(_mockWeatherRepository.getWeatherDataByCoordinates(
          weatherByCoordinatesRequestModel:
              WeatherByCoordinatesRequestModel(lon: lon, lat: lat),
        ));
        verifyNoMoreInteractions(_mockWeatherRepository);
      },
    );
  });
}
