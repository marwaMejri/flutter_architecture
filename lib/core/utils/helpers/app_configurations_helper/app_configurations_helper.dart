import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/app_theme_helper/custom_theme_data.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigurations {
  String? baseUrl = locator<AppFlavorsHelper>().baseUrl;
  CustomThemeData appTheme = CustomThemeData(
    buttonEnabledColor: blue3E97C8,
    buttonDisabledColor: blueD8E7F2,
    primaryColor: blue203C6F,
    validColor: green27B15F,
    secondaryColor: blueF3F6F8,
    thirdColor: blueD8E7F2,
    backgroundLightColor: white,
    backgroundGreyColor: greyE5E5EA,
    errorColor: redCF3A3A,
    loaderColor: blue203C6F,
    subTitleTextColor: black404040,
    titleTextColor: black101010,
  );
}
