import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';

class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget({
    Key? key,
    required this.buildWidget,
    this.initializeConfig=false,
  }) : super(key: key);

  final Widget Function(
      BuildContext context, ResponsiveUiConfig responsiveUiConfig) buildWidget;
  final bool initializeConfig;

  @override
  Widget build(BuildContext context) {
    final ResponsiveUiConfig responsiveUiConfig = locator<ResponsiveUiConfig>();
    if (initializeConfig) {
      responsiveUiConfig.initialize(context);
    }
    return buildWidget(context, responsiveUiConfig);
  }
}
