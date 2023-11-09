import 'package:flutter_architecture/core/utils/constants/app_constants.dart';

class EnvironmentConfig {
  static const String BUILD_VARIANT = String.fromEnvironment('BUILD_VARIANT',
      defaultValue: devEnvironmentString);
}
