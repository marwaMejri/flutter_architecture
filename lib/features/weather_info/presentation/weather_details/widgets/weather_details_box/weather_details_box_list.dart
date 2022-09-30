import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_box/box_info_item_widget.dart';
import 'package:flutter_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_box/weather_details_box_widget.dart';

class WeatherDetailsBoxList extends StatelessWidget {
  const WeatherDetailsBoxList({
    Key? key,
    this.sunsetSunriseEntity,
    this.windInfoEntity,
  }) : super(key: key);
  final SunsetSunriseEntity? sunsetSunriseEntity;
  final WindInfoEntity? windInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          WeatherDetailsBoxWidget(
            boxWidget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BoxInfoItemWidget(
                  boxInfoKey: 'Sunset',
                  boxInfoValue: sunsetSunriseEntity?.sunset,
                ),
                BoxInfoItemWidget(
                  boxInfoKey: 'Sunrise',
                  boxInfoValue: sunsetSunriseEntity?.sunrise,
                ),
              ],
            ),
            boxIcon: 'assets/sunset_icon.svg',
            boxTitle: 'Sunset & Sunrise',
          ),
          WeatherDetailsBoxWidget(
            boxWidgetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            boxWidget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BoxInfoItemWidget(
                  boxInfoKey: 'Speed',
                  boxInfoValue: windInfoEntity?.speed,
                ),
                BoxInfoItemWidget(
                  boxInfoKey: 'Degree',
                  boxInfoValue: windInfoEntity?.deg.toString(),
                ),
              ],
            ),
            boxIcon: 'assets/wind_icon.svg',
            boxTitle: 'Wind info',
          ),
        ],
      ),
    );
  }
}
