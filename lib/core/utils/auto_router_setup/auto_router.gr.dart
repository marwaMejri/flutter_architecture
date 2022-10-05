// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart'
    as _i5;
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/view/add_new_city_view.dart'
    as _i2;
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/view/weather_details.dart'
    as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    WeatherDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsViewRouteArgs>(
          orElse: () => const WeatherDetailsViewRouteArgs());
      return _i3.MaterialPageX<_i1.WeatherDetailsView>(
        routeData: routeData,
        child: _i1.WeatherDetailsView(
          key: args.key,
          weatherInfoEntity: args.weatherInfoEntity,
        ),
      );
    },
    AddNewCityViewRoute.name: (routeData) {
      return _i3.MaterialPageX<_i2.AddNewCityView>(
        routeData: routeData,
        child: const _i2.AddNewCityView(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          WeatherDetailsViewRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          AddNewCityViewRoute.name,
          path: '/add-new-city-view',
        ),
      ];
}

/// generated route for
/// [_i1.WeatherDetailsView]
class WeatherDetailsViewRoute
    extends _i3.PageRouteInfo<WeatherDetailsViewRouteArgs> {
  WeatherDetailsViewRoute({
    _i4.Key? key,
    _i5.WeatherInfoEntity? weatherInfoEntity,
  }) : super(
          WeatherDetailsViewRoute.name,
          path: '/',
          args: WeatherDetailsViewRouteArgs(
            key: key,
            weatherInfoEntity: weatherInfoEntity,
          ),
        );

  static const String name = 'WeatherDetailsViewRoute';
}

class WeatherDetailsViewRouteArgs {
  const WeatherDetailsViewRouteArgs({
    this.key,
    this.weatherInfoEntity,
  });

  final _i4.Key? key;

  final _i5.WeatherInfoEntity? weatherInfoEntity;

  @override
  String toString() {
    return 'WeatherDetailsViewRouteArgs{key: $key, weatherInfoEntity: $weatherInfoEntity}';
  }
}

/// generated route for
/// [_i2.AddNewCityView]
class AddNewCityViewRoute extends _i3.PageRouteInfo<void> {
  const AddNewCityViewRoute()
      : super(
          AddNewCityViewRoute.name,
          path: '/add-new-city-view',
        );

  static const String name = 'AddNewCityViewRoute';
}
