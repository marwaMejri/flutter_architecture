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
      return _i3.MaterialPageX<_i1.WeatherDetailsView>(
        routeData: routeData,
        child: const _i1.WeatherDetailsView(),
      );
    },
    AddNewCityViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewCityViewRouteArgs>(
          orElse: () => const AddNewCityViewRouteArgs());
      return _i3.MaterialPageX<_i2.AddNewCityView>(
        routeData: routeData,
        child: _i2.AddNewCityView(
          key: args.key,
          weatherInfoEntity: args.weatherInfoEntity,
        ),
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
class WeatherDetailsViewRoute extends _i3.PageRouteInfo<void> {
  const WeatherDetailsViewRoute()
      : super(
          WeatherDetailsViewRoute.name,
          path: '/',
        );

  static const String name = 'WeatherDetailsViewRoute';
}

/// generated route for
/// [_i2.AddNewCityView]
class AddNewCityViewRoute extends _i3.PageRouteInfo<AddNewCityViewRouteArgs> {
  AddNewCityViewRoute({
    _i4.Key? key,
    _i5.WeatherInfoEntity? weatherInfoEntity,
  }) : super(
          AddNewCityViewRoute.name,
          path: '/add-new-city-view',
          args: AddNewCityViewRouteArgs(
            key: key,
            weatherInfoEntity: weatherInfoEntity,
          ),
        );

  static const String name = 'AddNewCityViewRoute';
}

class AddNewCityViewRouteArgs {
  const AddNewCityViewRouteArgs({
    this.key,
    this.weatherInfoEntity,
  });

  final _i4.Key? key;

  final _i5.WeatherInfoEntity? weatherInfoEntity;

  @override
  String toString() {
    return 'AddNewCityViewRouteArgs{key: $key, weatherInfoEntity: $weatherInfoEntity}';
  }
}
