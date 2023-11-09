import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_state.dart';
import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/error_result_model.dart';
import 'package:flutter_architecture/core/commundomain/usecases/base_params_usecase.dart';

class BaseViewModel extends ChangeNotifier {
  final StreamController<bool> _toggleLoading =
      StreamController<bool>.broadcast();

  StreamController<bool> get toggleLoading => _toggleLoading;

  Future<ApiResultState<Type>?> executeParamsUseCase<Type, Params>({
    required BaseParamsUseCase<Type, Params> useCase,
    Params? query,
    bool launchLoader = true,
  }) async {
    showLoadingIndicator(launchLoader);
    final ApiResultModel<Type> _apiResult = await useCase(query);
    return _apiResult.when(
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
}
