import 'dart:async';
import 'dart:io';

import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/di/app_component/app_component.dart';
import 'package:flutter_architecture/core/utils/constants/app_constants.dart';
import 'package:flutter_architecture/core/utils/helpers/app_configurations_helper/app_configurations_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:flutter_architecture/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:flutter_architecture/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class HttpRequestContext {
  HttpRequestContext(this.connectivityCheckerHelper);

  final ConnectivityCheckerHelper connectivityCheckerHelper;
  final String? baseUrl = locator<AppConfigurations>().baseUrl;

  Map<String, String> _sharedDefaultHeader = <String, String>{};

  Future<void> initSharedDefaultHeader(
      [String contentValue = contentTypeValue]) async {
    _sharedDefaultHeader = <String, String>{};
    _sharedDefaultHeader.addAll(<String, String>{
      contentTypeKey: contentValue,
    });
  }

  Future<bool> _getConnectionState() async {
    final bool _result = await connectivityCheckerHelper.checkConnectivity();
    return _result;
  }

  Future<ApiResultModel<http.Response>> makeRequest({
    required String uri,
    required HttpRequestStrategy httpRequestStrategy,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> requestData = const <String, dynamic>{},
  }) async {
    await initSharedDefaultHeader();
    _sharedDefaultHeader.addAll(headers);
    if (await _getConnectionState()) {
      try {
        final String _url = '$baseUrl$uri';
        return httpRequestStrategy.executeRequest(
          uri: _url,
          headers: _sharedDefaultHeader,
          requestData: requestData,
        );
      } on TimeoutException catch (_) {
        return const ApiResultModel<http.Response>.failure(
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
