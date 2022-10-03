import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherSingleInfo extends StatelessWidget {
  WeatherSingleInfo({
    this.infoTitle,
    this.infoDescription,
    this.assetString,
    this.assetSize,
  });

  final String? infoTitle;
  final String? infoDescription;
  final String? assetString;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          infoTitle ?? '',
          style: poppinsRegular.copyWith(
            fontSize: 16.w,
            color: Colors.white70,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (assetString != null)
              SvgPicture.asset(
                assetString!,
                color: primaryColor,
                width: assetSize ?? 20.w,
              ),
            Text(
              infoDescription ?? '',
              style: poppinsRegular.copyWith(
                fontSize: 14.w,
                color: lightColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}