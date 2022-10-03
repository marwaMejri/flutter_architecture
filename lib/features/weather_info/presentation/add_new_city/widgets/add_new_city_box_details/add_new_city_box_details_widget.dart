import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';

import '../../../../../../core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';
import '../../../../../../core/utils/values/colors.dart';
import '../../../../../../core/utils/values/styles.dart';
import '../../../../domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';

class AddNewCityBoxDetailsWidget extends StatelessWidget {
  const AddNewCityBoxDetailsWidget({Key? key, this.weatherInfoEntity})
      : super(key: key);
  final WeatherInfoEntity? weatherInfoEntity;

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget:
          (BuildContext context, ResponsiveUiConfig responsiveUiConfig) {
        return Container(
          width: responsiveUiConfig.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          margin: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                weatherInfoEntity?.weatherTheme?.secondColor ?? lightBlue,
                weatherInfoEntity?.weatherTheme?.firstColor ?? blue,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.w,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                weatherInfoEntity?.name ?? '',
                style: poppinsBold.copyWith(
                  color: primaryColor,
                  fontSize: 20.w,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    weatherInfoEntity?.main?.temp ?? '',
                    style: poppinsRegular.copyWith(
                      fontSize: 16.w,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    weatherInfoEntity?.weather?[0]?.description ?? '',
                    style: poppinsRegular.copyWith(
                      fontSize: 16.w,
                      color: primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
