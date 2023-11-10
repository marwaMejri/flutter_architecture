import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_config.dart';
import 'package:flutter_architecture/core/utils/values/styles.dart';

class SearchCityWidget extends StatelessWidget {
  const SearchCityWidget({
    Key? key,
    this.controller,
    required this.onTapFunction,
  }) : super(key: key);
  final TextEditingController? controller;
  final Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      buildWidget: (BuildContext context, ResponsiveUiConfig responsiveUiConfig,
          AppConfigurations appConfigurations) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 20.h,
              ),
              decoration: BoxDecoration(
                color: appConfigurations.appTheme.thirdColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.w,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Add City',
                    style: poppinsBold.copyWith(
                      color: appConfigurations.appTheme.primaryColor,
                      fontSize: 20.w,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                        8.w,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      hintText: 'Enter a place name',
                      prefixIcon: Icon(
                        Icons.search,
                        color: appConfigurations.appTheme.backgroundGreyColor,
                        size: 25.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onTapFunction();
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        10.w,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appConfigurations.appTheme.primaryColor,
                      ),
                      child: Icon(
                        Icons.check,
                        color: appConfigurations.appTheme.secondaryColor,
                        size: 50.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
