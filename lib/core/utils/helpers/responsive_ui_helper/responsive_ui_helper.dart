import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResponsiveUiConfig {
  late MediaQueryData _mediaQueryData;
  late double _screenWidth;
  late double _screenHeight;
  String? _baseUrl;
  BuildContext? context;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  String? get baseUrl => _baseUrl;

  ///this method initialize all of our attributes
  void initialize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    this.context = context;
  }

  double setWidth(num value) => _screenWidth * (value / 375);
  double setHeight(num value) => _screenHeight * (value / 812);

}
