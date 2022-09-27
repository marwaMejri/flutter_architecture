import 'dart:convert';

import 'package:http/http.dart';

extension ExtensionsOnString on String {
  Uri parseUri({Map<String, dynamic>? params}) {
    return Uri.parse(
      this,
    ).replace(
      queryParameters: params?.map(
        (key, value) => MapEntry(
          key,
          value.toString(),
        ),
      ),
    );
  }
}

extension ExtensionsOnHttpResponse on Response {
  dynamic decodeJson() {
    return jsonDecode(this.body);
  }
}
