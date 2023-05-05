import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}
@GenerateMocks([MockWeatherRepository])
class Mocks{}