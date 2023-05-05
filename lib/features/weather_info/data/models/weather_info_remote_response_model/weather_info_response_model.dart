import 'package:flutter_architecture/core/utils/helpers/extension_functions/date_extension_functions.dart';
import 'package:flutter_architecture/core/utils/helpers/extension_functions/extension_functions.dart';
import 'package:flutter_architecture/core/utils/mapper/data_mapper.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/clouds_response/clouds_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/coordinate_response/coordinate_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/main_weather_info_response/main_weather_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/sunset_sunrise_response/sunset_sunrise_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_description_response/weather_description_response_model.dart';
import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/wind_info_response/wind_info_response_model.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/clouds_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/main_weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/sunset_sunrise_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_description_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/wind_info_entity.dart';
import 'package:flutter_architecture/features/weather_info/utils/enums/weather_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_info_response_model.g.dart';

@JsonSerializable()
class WeatherInfoResponseModel extends DataMapper<WeatherInfoEntity> {
  WeatherInfoResponseModel(
      {this.coordinateData,
      this.weatherDescription,
      this.mainWeatherData,
      this.weatherVisibility,
      this.windData,
      this.cloudsData,
      this.date,
      this.sunsetAndSunriseData,
      this.timezone,
      this.id,
      this.cityName,
     });
  factory WeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoResponseModelFromJson(json);
  @JsonKey(name: 'coord')
  CoordinateResponseModel? coordinateData;
  @JsonKey(name: 'weather')
  List<WeatherDescriptionResponseModel>? weatherDescription;
  @JsonKey(name: 'main')
  MainWeatherInfoResponseModel? mainWeatherData;
  @JsonKey(name: 'visibility')
  int? weatherVisibility;
  @JsonKey(name: 'wind')
  WindInfoResponseModel? windData;
  @JsonKey(name: 'clouds')
  CloudsResponseModel? cloudsData;
  @JsonKey(name: 'dt')
  int? date;
  @JsonKey(name: 'sys')
  SunsetSunriseResponseModel? sunsetAndSunriseData;
  int? timezone;
  int? id;
  @JsonKey(name: 'name')
  String? cityName;



  @override
  WeatherInfoEntity mapToEntity() {
    final List<WeatherDescriptionEntity>? _weatherDescription =
        weatherDescription
            ?.map((WeatherDescriptionResponseModel weatherDescriptionEntity) =>
                weatherDescriptionEntity.mapToEntity())
            .toList();
    final WeatherTypeEnum? weatherTypeEnum =
        _weatherDescription?[0].main?.toWeatherType();
    return WeatherInfoEntity(
      main: mainWeatherData?.mapToEntity() ?? const MainWeatherInfoEntity(),
      id: id ?? 0,
      visibility: weatherVisibility?.toKM() ?? '',
      clouds: cloudsData?.mapToEntity() ?? const CloudsEntity(),
      weather: _weatherDescription,
      dt: date?.fromTimestampToDate(),
      name: cityName ?? '',
      sys: sunsetAndSunriseData?.mapToEntity() ?? const SunsetSunriseEntity(),
      timezone: timezone ?? 0,
      wind: windData?.mapToEntity() ?? const WindInfoEntity(),
      weatherTheme: weatherTypeEnum.toWeatherTheme(),
    );
  }
}
