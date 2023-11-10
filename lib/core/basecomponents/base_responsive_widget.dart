import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';

class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget({
    Key? key,
    required this.buildWidget,
    this.initializeConfig = false,
  }) : super(key: key);

  final Widget Function(
      BuildContext context,
      ResponsiveUiConfig responsiveUiConfig,
      AppConfigurations appConfigurations) buildWidget;
  final bool initializeConfig;

  @override
  Widget build(BuildContext context) {
    final ResponsiveUiConfig responsiveUiConfig = locator<ResponsiveUiConfig>();
    final AppConfigurations appConfigurations = locator<AppConfigurations>();
    if (initializeConfig) {
      responsiveUiConfig.initialize(context);
    }
    return buildWidget(context, responsiveUiConfig, appConfigurations);
  }
}
