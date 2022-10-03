import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';


class WeatherDetailsHeader extends StatelessWidget {
  const WeatherDetailsHeader({
    Key? key,
    this.locationName,
    this.date,
  }) : super(key: key);
  final String? locationName;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            locationName ?? '',
            style: poppinsBold.copyWith(
              color: primaryColor,
              fontSize: 22.w,
            ),
          ),
          Text(
            date ?? '',
            style: poppinsRegular.copyWith(
              color: primaryColor,
              fontSize: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
