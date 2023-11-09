import 'dart:convert';

import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/http_response_extensions.dart';
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';
import 'package:http/http.dart' as http;

class DeleteRequestStrategy implements HttpRequestStrategy {
  @override
  Future<ApiResultModel<http.Response>> executeRequest({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> requestData = const <String, dynamic>{},
  }) async {
    final String encodedJson = json.encode(requestData);
    final http.Response response = await http
        .delete(
          Uri.parse(uri),
          headers: headers,
          body: encodedJson,
        )
        .timeout(timeOutDuration);
    return response.performHttpRequest();
  }
}
