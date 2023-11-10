// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_architecture/core/di/app_component/app_module.dart'
    as _i20;
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart'
    as _i3;
import 'package:flutter_architecture/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart'
    as _i4;
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart'
    as _i6;
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_context.dart'
    as _i7;
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart'
    as _i8;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/local_database.dart'
    as _i5;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource.dart'
    as _i9;
import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/weather_local_datasource_impl.dart'
    as _i10;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart'
    as _i11;
import 'package:flutter_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource_impl.dart'
    as _i12;
import 'package:flutter_architecture/features/weather_info/data/repositories/weather_repository_impl.dart'
    as _i14;
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart'
    as _i13;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_all_local_weathers.dart'
    as _i15;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart'
    as _i16;
import 'package:flutter_architecture/features/weather_info/domain/usecases/get_weather_data_by_coordinates.dart'
    as _i17;
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/add_new_city_viewmodel.dart'
    as _i19;
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/weather_details_viewmodel.dart'
    as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppConfigurations>(_i3.AppConfigurations());
    gh.singleton<_i4.AppFlavorsHelper>(_i4.AppFlavorsHelper());
    await gh.factoryAsync<_i5.AppLocalDatabase>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i6.ConnectivityCheckerHelper>(
        () => _i6.ConnectivityCheckerHelper());
    gh.factory<_i7.HttpRequestContext>(
        () => _i7.HttpRequestContext(gh<_i6.ConnectivityCheckerHelper>()));
    gh.singleton<_i8.ResponsiveUiConfig>(_i8.ResponsiveUiConfig());
    gh.factory<_i9.WeatherLocalDataSource>(
        () => _i10.WeatherRemoteDataSourceImpl(gh<_i5.AppLocalDatabase>()));
    gh.factory<_i11.WeatherRemoteDataSource>(
        () => _i12.WeatherRemoteDataSourceImpl(gh<_i7.HttpRequestContext>()));
    gh.factory<_i13.WeatherRepository>(() => _i14.WeatherRepositoryImpl(
          remoteDataSource: gh<_i11.WeatherRemoteDataSource>(),
          localDataSource: gh<_i9.WeatherLocalDataSource>(),
        ));
    gh.factory<_i15.GetAllLocalWeathers>(
        () => _i15.GetAllLocalWeathers(gh<_i13.WeatherRepository>()));
    gh.factory<_i16.GetWeatherDataByCity>(
        () => _i16.GetWeatherDataByCity(gh<_i13.WeatherRepository>()));
    gh.factory<_i17.GetWeatherDataByCoordinates>(
        () => _i17.GetWeatherDataByCoordinates(gh<_i13.WeatherRepository>()));
    gh.factory<_i18.WeatherDetailsViewModel>(() =>
        _i18.WeatherDetailsViewModel(gh<_i17.GetWeatherDataByCoordinates>()));
    gh.factory<_i19.AddNewCityViewModel>(() => _i19.AddNewCityViewModel(
          gh<_i16.GetWeatherDataByCity>(),
          gh<_i15.GetAllLocalWeathers>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
