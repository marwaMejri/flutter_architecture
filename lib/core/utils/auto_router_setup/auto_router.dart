import 'package:auto_route/annotations.dart';
import 'package:flutter_architecture/features/weather_info/presentation/add_new_city/view/add_new_city_view.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/view/weather_details.dart';

@MaterialAutoRouter(
  preferRelativeImports: false,
  routes: <AutoRoute<dynamic>>[
    MaterialRoute<WeatherDetailsView>(
      page: WeatherDetailsView,
      initial: true,
    ),
    MaterialRoute<AddNewCityView>(
      page: AddNewCityView,
    ),
  ],
)
class $Router {}
