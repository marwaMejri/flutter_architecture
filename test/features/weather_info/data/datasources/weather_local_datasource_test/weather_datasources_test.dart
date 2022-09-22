import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockWeatherLocalDataSource extends Mock
    implements WeatherLocalDataSource {}

@GenerateMocks([MockWeatherLocalDataSource])
class Mocks {}
