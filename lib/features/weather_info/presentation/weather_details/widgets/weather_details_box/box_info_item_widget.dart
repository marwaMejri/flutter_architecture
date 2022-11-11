import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/size_extension.dart';
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
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '$boxInfoKey: ',
        style: poppinsRegular.copyWith(
          color: lightColor,
          fontSize: 15.w,
        ),
        children: <TextSpan>[
          TextSpan(
            text: boxInfoValue ?? '',
            style: poppinsBold.copyWith(
              color: lightColor,
              fontSize: 13.w,
            ),
          ),
        ],
      ),
    );
  }
}
