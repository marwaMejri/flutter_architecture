import 'dart:convert';
import 'dart:io';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/clouds_response/clouds_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/coordinate_response/coordinate_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/main_weather_info_response/main_weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/sunset_sunrise_response/sunset_sunrise_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_description_response/weather_description_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/wind_info_response/wind_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
  test(
    'should be a subclass of WeatherInfoEntity()',
    () async {
      //assert
      expect(_weatherInfoResponseModel.mapToEntity(),
          isA<WeatherInfoEntity>());
    },
  );
  group('test fromJson() function', () {
    test(
      'should return valid model',
      () async {
        //arrange
        final Map<String, dynamic> _jsonMap = json.decode(
            File('test_assets/weather_info_json_data.json').readAsStringSync());
        //act
        final WeatherInfoResponseModel result =
            WeatherInfoResponseModel.fromJson(_jsonMap);
        //assert
        expect(result.mapToEntity(),
            _weatherInfoResponseModel.mapToEntity());
      },
    );
  });
}
