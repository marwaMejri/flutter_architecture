import 'dart:async';
import 'dart:io';

import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class ApiCallHelper {
  ApiCallHelper(this.connectivityCheckerHelper);

  final ConnectivityCheckerHelper connectivityCheckerHelper;
  final String? baseUrl = devBaseUrl;

  Map<String, String> _sharedDefaultHeader = <String, String>{};

  Future<void> initSharedDefaultHeader(
      [String contentValue = contentTypeValue]) async {
    _sharedDefaultHeader = <String, String>{};
    _sharedDefaultHeader.addAll(<String, String>{
      contentTypeKey: contentValue,
    });
  }

  Future<bool> _getConnectionState() async {
    return await connectivityCheckerHelper.checkConnectivity();
  }

  ///@[params] should be added to the url as the api params
  Future<ApiResultModel<http.Response>> getWS({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> params = const <String, dynamic>{},
  }) async {
    await initSharedDefaultHeader();
    _sharedDefaultHeader.addAll(headers);
    if (await _getConnectionState()) {
      try {
        String _url = '$baseUrl$uri';
        final http.Response response = await http
            .get(_url.parseUri(params: params), headers: _sharedDefaultHeader)
            .timeout(timeOutDuration);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return ApiResultModel<http.Response>.success(data: response);
        } else {
          return ApiResultModel<http.Response>.failure(
            errorResultEntity: ErrorResultModel(
              message: response.reasonPhrase,
              statusCode: response.statusCode,
            ),
          );
        }
      } on TimeoutException catch (_) {
        return ApiResultModel<http.Response>.failure(
          errorResultEntity: ErrorResultModel(
            message: commonErrorUnexpectedMessage,
            statusCode: timeoutRequestStatusCode,
          ),
        );
      } on IOException catch (_) {
        throw CustomConnectionException(
          exceptionMessage: commonConnectionFailedMessage,
          exceptionCode: ioExceptionStatusCode,
        );
      }
    } else {
      throw CustomConnectionException(
        exceptionMessage: commonConnectionFailedMessage,
        exceptionCode: ioExceptionStatusCode,
      );
    }
  }
}
