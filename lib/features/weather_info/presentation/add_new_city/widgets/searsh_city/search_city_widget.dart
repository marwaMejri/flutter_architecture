import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/basecomponents/base_responsive_widget.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
import 'package:flutter_architecture/core/utils/helpers/responsive_ui_helper/responsive_ui_helper.dart';
import 'package:flutter_architecture/core/utils/values/colors.dart';
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
      buildWidget:
          (BuildContext context, ResponsiveUiConfig responsiveUiConfig) {
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
                color: lightColor,
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
                      color: primaryColor,
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
                        color: grey,
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
                        color: blue,
                      ),
                      child: Icon(
                        Icons.check,
                        color: lightColor,
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
