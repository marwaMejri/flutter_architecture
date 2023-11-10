import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherDetailsBoxWidget extends StatelessWidget {
  const WeatherDetailsBoxWidget({
    Key? key,
    this.boxTitle,
    this.boxIcon,
    required this.boxWidget,
    this.boxWidgetPadding,
  }) : super(key: key);
  final String? boxTitle;
  final String? boxIcon;
  final Widget boxWidget;
  final EdgeInsets? boxWidgetPadding;

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig, AppConfigurations appConfigurations) =>
      Container(
        padding: boxWidgetPadding ?? EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: appConfigurations.appTheme.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(20.w),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              boxTitle ?? '',
              style: poppinsRegular.copyWith(
                color: Colors.white70,
                fontSize: 16.w,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (boxIcon != null)
              SvgPicture.asset(
                boxIcon!,
                width: 60.w,
                color:  appConfigurations.appTheme.primaryColor,
              ),
            SizedBox(
              height: 15.h,
            ),
            boxWidget,
          ],
        ),
      ),
    );
  }
}
