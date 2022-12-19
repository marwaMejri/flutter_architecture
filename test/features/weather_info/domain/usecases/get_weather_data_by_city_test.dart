import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repositories/weather_repository_test.mocks.dart';

void main() {
  late MockMockWeatherRepository _mockWeatherRepository;
  late GetWeatherDataByCity _sut;
  setUp(() {
    _mockWeatherRepository = MockMockWeatherRepository();
    _sut = GetWeatherDataByCity(_mockWeatherRepository);
  });
  group('test getWeatherDataByCity() use case', () {
    const String _cityName = 'sousse';

    const WeatherInfoEntity _mockedResult = WeatherInfoEntity(
      clouds: CloudsEntity(all: 0),
      name: _cityName,
      weather: <WeatherDescriptionEntity>[
        WeatherDescriptionEntity(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        ),
      ],
    );
    void _arrangeResponse() {
      when(_mockWeatherRepository.getWeatherDataByCity(cityName: _cityName))
          .thenAnswer((_) async {
        return const ApiResultModel<WeatherInfoEntity>.success(data: _mockedResult);
      });
    }

    test(
      'should get weather data from the repository with the given city name',
      () async {
        //arrange
        _arrangeResponse();
        //act
        final ApiResultModel<WeatherInfoEntity?> result = await _sut(_cityName);
        //assert
        expect(
          result,
          const ApiResultModel<WeatherInfoEntity>.success(data: _mockedResult),
        );
      },
    );
  });
}
