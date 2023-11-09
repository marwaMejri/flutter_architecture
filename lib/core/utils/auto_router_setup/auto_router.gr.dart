// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart'
    as _i5;
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/view/add_new_city_view.dart'
    as _i1;
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/view/weather_details.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddNewCityView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddNewCityView(),
      );
    },
    WeatherDetailsView.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsViewArgs>(
          orElse: () => const WeatherDetailsViewArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.WeatherDetailsView(
          key: args.key,
          weatherInfoEntity: args.weatherInfoEntity,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddNewCityView]
class AddNewCityView extends _i3.PageRouteInfo<void> {
  const AddNewCityView({List<_i3.PageRouteInfo>? children})
      : super(
          AddNewCityView.name,
          initialChildren: children,
        );

  static const String name = 'AddNewCityView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WeatherDetailsView]
class WeatherDetailsView extends _i3.PageRouteInfo<WeatherDetailsViewArgs> {
  WeatherDetailsView({
    _i4.Key? key,
    _i5.WeatherInfoEntity? weatherInfoEntity,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WeatherDetailsView.name,
          args: WeatherDetailsViewArgs(
            key: key,
            weatherInfoEntity: weatherInfoEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherDetailsView';

  static const _i3.PageInfo<WeatherDetailsViewArgs> page =
      _i3.PageInfo<WeatherDetailsViewArgs>(name);
}

class WeatherDetailsViewArgs {
  const WeatherDetailsViewArgs({
    this.key,
    this.weatherInfoEntity,
  });

  final _i4.Key? key;

  final _i5.WeatherInfoEntity? weatherInfoEntity;

  @override
  String toString() {
    return 'WeatherDetailsViewArgs{key: $key, weatherInfoEntity: $weatherInfoEntity}';
  }
}
