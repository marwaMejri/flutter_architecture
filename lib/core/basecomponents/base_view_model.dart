import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/commundomain/usecases/base_params_usecase.dart';

class BaseViewModel extends ChangeNotifier {
  StreamController<bool> _toggleLoading = StreamController<bool>.broadcast();

  StreamController<bool> get toggleLoading => _toggleLoading;

  void showLoadingIndicator(bool show) {
    _toggleLoading.add(show);
  }

  void onDispose() {}

  @override
  void dispose() {
    _toggleLoading.close();
    onDispose();
    super.dispose();
  }

  Future<ApiResultState<Type>?> executeParamsUseCase<Type, Params>(
      {required BaseParamsUseCase<Type, Params> useCase, Params? query}) async {
    showLoadingIndicator(true);
    final ApiResultModel<Type>? _apiResult = await useCase.call(query);
    return _apiResult?.when(
      success: (Type data) {
        showLoadingIndicator(false);
        return ApiResultState<Type>.data(data: data);
      },
      failure: (ErrorResultModel errorResultEntity) {
        showLoadingIndicator(false);
        return ApiResultState<Type>.error(
          errorResultModel: ErrorResultModel(
            message: errorResultEntity.message,
            statusCode: errorResultEntity.statusCode,
          ),
        );
      },
    );
  }
}
