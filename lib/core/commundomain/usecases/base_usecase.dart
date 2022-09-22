import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';

abstract class BaseUseCase<Type> {
  Future<ApiResultModel<Type>> call();
}
