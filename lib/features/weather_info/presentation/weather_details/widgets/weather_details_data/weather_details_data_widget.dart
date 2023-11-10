import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_data/weather_single_info_widget.dart';

class WeatherDetailsDataWidget extends StatelessWidget {
  const WeatherDetailsDataWidget({
    Key? key,
    this.weatherDescription,
    this.weatherVisibility,
    this.mainWeatherInfoEntity,
  }) : super(key: key);
  final String? weatherDescription;
  final String? weatherVisibility;
  final MainWeatherInfoEntity? mainWeatherInfoEntity;

  @override
  Widget build(BuildContext context) {
    final AppConfigurations appConfigurations = locator<AppConfigurations>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          weatherDescription ?? '',
          style: poppinsBoldItalic.copyWith(
            color: appConfigurations.appTheme.primaryColor,
            fontSize: 16.w,
          ),
        ),
        Text(
          mainWeatherInfoEntity?.temp ?? '',
          style: poppinsBoldItalic.copyWith(
            color: appConfigurations.appTheme.primaryColor,
            fontSize: 50.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 25.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              WeatherSingleInfo(
                infoTitle: 'Pressure',
                assetSize: 25.w,
                assetString: 'assets/pressure_icon.svg',
                infoDescription: '${mainWeatherInfoEntity?.pressure}',
              ),
              WeatherSingleInfo(
                infoTitle: 'Visibility',
                assetSize: 20.w,
                assetString: 'assets/visibility_icon.svg',
                infoDescription: weatherVisibility,
              ),
              WeatherSingleInfo(
                infoTitle: 'Humidity',
                assetString: 'assets/humidity_icon.svg',
                infoDescription: '${mainWeatherInfoEntity?.humidity}%',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
