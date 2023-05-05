import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_weather_info_response_model.g.dart';

@JsonSerializable()
class MainWeatherInfoResponseModel extends DataMapper<MainWeatherInfoEntity> {
  MainWeatherInfoResponseModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainWeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoResponseModelFromJson(json);

  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  @override
  MainWeatherInfoEntity mapToEntity() {
    return MainWeatherInfoEntity(
      temp: temp?.toCelsius() ?? '',
      feelsLike: feelsLike ?? 0.0,
      humidity: humidity ?? 0,
      pressure: pressure ?? 0,
      tempMax: tempMax ?? 0.0,
      tempMin: tempMin ?? 0.0,
    );
  }
}
