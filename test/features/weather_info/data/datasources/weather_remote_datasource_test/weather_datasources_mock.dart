import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class RemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

@GenerateMocks([RemoteDataSource])
class Mocks {}