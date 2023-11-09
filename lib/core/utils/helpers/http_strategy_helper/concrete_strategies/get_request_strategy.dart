import 'dart:async';

import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/http_response_extensions.dart';
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';
import 'package:http/http.dart' as http;

class GetRequestStrategy implements HttpRequestStrategy {
  @override
  Future<ApiResultModel<http.Response>> executeRequest({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> requestData = const <String, dynamic>{},
  }) async {
    final http.Response response = await http
        .get(uri.parseUri(params: requestData), headers: headers)
        .timeout(timeOutDuration);
    return response.performHttpRequest();
  }
}
