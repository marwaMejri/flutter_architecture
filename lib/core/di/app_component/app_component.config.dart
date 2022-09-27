// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_architecture/core/utils/helpers/api_call_helper/api_call_helper.dart'
    as _i5;
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i3;
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart'
    as _i4;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart'
    as _i6;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource_impl.dart'
    as _i7;
import 'package:flutter_architecture/features/weather_info/data/repositories/weather_repository_impl.dart'
    as _i9;
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart'
    as _i8;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i10;
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ConnectivityCheckerHelper>(
      () => _i3.ConnectivityCheckerHelper());
  gh.singleton<_i4.ResponsiveUiConfig>(_i4.ResponsiveUiConfig());
  gh.factory<_i5.ApiCallHelper>(
      () => _i5.ApiCallHelper(get<_i3.ConnectivityCheckerHelper>()));
  gh.factory<_i6.WeatherRemoteDataSource>(
      () => _i7.WeatherRemoteDataSourceImpl(get<_i5.ApiCallHelper>()));
  gh.factory<_i8.WeatherRepository>(() => _i9.WeatherRepositoryImpl(
      remoteDataSource: get<_i6.WeatherRemoteDataSource>()));
  gh.factory<_i10.GetWeatherDataByCoordinates>(
      () => _i10.GetWeatherDataByCoordinates(get<_i8.WeatherRepository>()));
  gh.factory<_i11.WeatherDetailsViewModel>(() =>
      _i11.WeatherDetailsViewModel(get<_i10.GetWeatherDataByCoordinates>()));
  return get;
}
