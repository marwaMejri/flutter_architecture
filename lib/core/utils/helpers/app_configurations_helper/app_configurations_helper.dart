import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigurationsHelper {
  String? get baseUrl => locator<AppFlavorsHelper>().baseUrl;
}
