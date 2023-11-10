import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';

class BoxInfoItemWidget extends StatelessWidget {
  const BoxInfoItemWidget({
    Key? key,
    this.boxInfoKey,
    this.boxInfoValue,
  }) : super(key: key);
  final String? boxInfoKey;
  final String? boxInfoValue;

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig,
              AppConfigurations appConfigurations) =>
          RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$boxInfoKey: ',
          style: poppinsRegular.copyWith(
            color: appConfigurations.appTheme.backgroundLightColor,
            fontSize: 15.w,
          ),
          children: <TextSpan>[
            TextSpan(
              text: boxInfoValue ?? '',
              style: poppinsBold.copyWith(
                color: appConfigurations.appTheme.backgroundLightColor,
                fontSize: 13.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
