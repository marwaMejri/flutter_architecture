// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_architecture/core/di/app_component/app_module.dart'
    as _i17;
import 'package:flutter_architecture/core/utils/helpers/api_call_helper/api_call_helper.dart'
    as _i8;
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i4;
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart'
    as _i5;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/local_database.dart'
    as _i3;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart'
    as _i6;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource_impl.dart'
    as _i7;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart'
    as _i9;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource_impl.dart'
    as _i10;
import 'package:flutter_architecture/features/weather_info/data/repositories/weather_repository_impl.dart'
    as _i12;
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart'
    as _i11;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart'
    as _i13;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i14;
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart'
    as _i16;
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.AppLocalDatabase>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i4.ConnectivityCheckerHelper>(
      () => _i4.ConnectivityCheckerHelper());
  gh.singleton<_i5.ResponsiveUiConfig>(_i5.ResponsiveUiConfig());
  gh.factory<_i6.WeatherLocalDataSource>(
      () => _i7.WeatherRemoteDataSourceImpl(get<_i3.AppLocalDatabase>()));
  gh.factory<_i8.ApiCallHelper>(
      () => _i8.ApiCallHelper(get<_i4.ConnectivityCheckerHelper>()));
  gh.factory<_i9.WeatherRemoteDataSource>(
      () => _i10.WeatherRemoteDataSourceImpl(get<_i8.ApiCallHelper>()));
  gh.factory<_i11.WeatherRepository>(() => _i12.WeatherRepositoryImpl(
        remoteDataSource: get<_i9.WeatherRemoteDataSource>(),
        localDataSource: get<_i6.WeatherLocalDataSource>(),
      ));
  gh.factory<_i13.GetWeatherDataByCity>(
      () => _i13.GetWeatherDataByCity(get<_i11.WeatherRepository>()));
  gh.factory<_i14.GetWeatherDataByCoordinates>(
      () => _i14.GetWeatherDataByCoordinates(get<_i11.WeatherRepository>()));
  gh.factory<_i15.WeatherDetailsViewModel>(() =>
      _i15.WeatherDetailsViewModel(get<_i14.GetWeatherDataByCoordinates>()));
  gh.factory<_i16.AddNewCityViewModel>(
      () => _i16.AddNewCityViewModel(get<_i13.GetWeatherDataByCity>()));
  return get;
}

class _$AppModule extends _i17.AppModule {}
