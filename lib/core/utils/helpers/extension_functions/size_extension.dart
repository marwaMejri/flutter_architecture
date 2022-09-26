import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';

extension ExtensionsOnNum on num {
  static ResponsiveUiConfig _responsiveUiConfig = locator<ResponsiveUiConfig>();

  double get w => _responsiveUiConfig.setWidth(this);

  double get h => _responsiveUiConfig.setHeight(this);
}
