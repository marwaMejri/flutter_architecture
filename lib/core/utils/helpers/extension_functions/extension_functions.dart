import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

extension ExtensionsOnString on String {
  Uri parseUri({Map<String, dynamic>? params}) {
    return Uri.parse(
      this,
    ).replace(
      queryParameters: params?.map(
        (String key, dynamic value) => MapEntry<String,dynamic>(
          key,
          value.toString(),
        ),
      ),
    );
  }

  bool isEqual(String? value) {
    return toLowerCase() == value?.toLowerCase();
  }
}

extension ExtensionsOnDouble on double? {
  String? toWindSpeed() {
    if (this != null) {
      return '${toString()}km/h';
    }
    return null;
  }

  String? toCelsius() {
    if (this != null) {
      final NumberFormat numberFormat = NumberFormat('###.##', 'en_US');
      final double value = this! - 273.15;
      return '${numberFormat.format(value)}°';
    }
    return null;
  }
}

extension ExtensionsOnInt on int? {
  String? toKM() {
    if (this != null) {
      return '${(this! / 1000).round()}Km';
    }
    return null;
  }
}

extension ExtensionsOnHttpResponse on Response {
  dynamic decodeJson() {
    return jsonDecode(body);
  }
}
