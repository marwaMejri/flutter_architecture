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

  ApiResultState _viewModelState = const ApiResultState.data(data: '');

  void setState(ApiResultState value) {
    _viewModelState = value;
  }

  void setStateAndNotifyListeners(ApiResultState value) {
    _viewModelState = value;
    notifyListeners();
  }

  Future<void> executeParamsUseCase<Type, Params>(
      BaseParamsUseCase<Type, Params> useCase, Params query) async {
    showLoadingIndicator(true);
    final ApiResultModel<Type>? _apiResult = await useCase.call(query);
    _apiResult?.when(success: (Type data) {
      _viewModelState = ApiResultState<Type>.data(data: data);
      showLoadingIndicator(false);
      setStateAndNotifyListeners(_viewModelState);
    }, failure: (ErrorResultModel errorResultEntity) {
      _viewModelState = ApiResultState<Type>.error(
        errorResultModel: ErrorResultModel(
          message: errorResultEntity.message,
          statusCode: errorResultEntity.statusCode,
        ),
      );
      showLoadingIndicator(false);
      setStateAndNotifyListeners(_viewModelState);
    });
  }
}