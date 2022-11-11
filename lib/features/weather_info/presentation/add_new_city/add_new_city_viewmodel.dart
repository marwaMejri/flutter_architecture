import 'dart:async';

import 'package:flutter_architecture/core/basecomponents/base_view_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_all_local_weathers.dart';
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewCityViewModel extends BaseViewModel {
  AddNewCityViewModel(
    this.getWeatherDataByCity,
    this.getAllLocalWeathers,
  );

  final GetWeatherDataByCity getWeatherDataByCity;
  final GetAllLocalWeathers getAllLocalWeathers;

  final StreamController<ApiResultState<WeatherInfoEntity?>?> _weatherResult =
      StreamController<ApiResultState<WeatherInfoEntity?>?>.broadcast();

  StreamController<ApiResultState<WeatherInfoEntity?>?> get weatherResult =>
      _weatherResult;
  final StreamController<ApiResultState<List<WeatherInfoEntity?>?>?>
      _weatherLocalResult =
      StreamController<ApiResultState<List<WeatherInfoEntity?>?>?>.broadcast();

  StreamController<ApiResultState<List<WeatherInfoEntity?>?>?>
      get weatherLocalResult => _weatherLocalResult;

  Future<void> getWeatherByCity({String? cityName}) async {
    final ApiResultState<WeatherInfoEntity?>? _result =
        await executeParamsUseCase(
      useCase: getWeatherDataByCity,
      query: cityName,
    );
    _weatherResult.add(_result);
  }

  Future<void> getAllLocalWeathersData() async {
    final ApiResultState<List<WeatherInfoEntity?>?>? _result =
        await executeParamsUseCase(
      useCase: getAllLocalWeathers,
    );
    _weatherLocalResult.add(_result);
  }

  @override
  void onDispose() {
    super.onDispose();
    _weatherLocalResult.close();
    _weatherResult.close();
  }
}
