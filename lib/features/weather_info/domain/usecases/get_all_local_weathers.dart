import 'package:flutter_architecture/core/commundomain/entitties/based_api_result/api_result_model.dart';
import 'package:flutter_architecture/core/commundomain/usecases/base_params_usecase.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllLocalWeathers
    implements BaseParamsUseCase<List<WeatherInfoEntity?>?, NoParams> {
  GetAllLocalWeathers(this.weatherRepository);

  final WeatherRepository weatherRepository;

  @override
  Future<ApiResultModel<List<WeatherInfoEntity?>?>> call(NoParams? params) {
    return weatherRepository.getAllLocalWeathers();

  }


}
