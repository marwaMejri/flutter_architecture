import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_theme_entity.dart';

enum WeatherTypeEnum {
  Thunderstorm,
  Drizzle,
  Rain,
  Snow,
  Clear,
  Clouds,
  other,
}

extension WeatherTypeEnumExtension on String? {
  WeatherTypeEnum? toWeatherType() {
    WeatherTypeEnum? value;
    switch (this) {
      case 'Thunderstorm':
        value = WeatherTypeEnum.Thunderstorm;
        break;
      case 'Drizzle':
        value = WeatherTypeEnum.Drizzle;
        break;
      case 'Snow':
        value = WeatherTypeEnum.Snow;
        break;
      case 'Rain':
        value = WeatherTypeEnum.Rain;
        break;
      case 'Clear':
        value = WeatherTypeEnum.Clear;
        break;
      case 'Clouds':
        value = WeatherTypeEnum.Clouds;
        break;
      default:
        value = WeatherTypeEnum.other;
        break;
    }
    return value;
  }
}

extension WeatherTypeEnumThemeExtension on WeatherTypeEnum? {
  WeatherThemeEntity? toWeatherTheme() {
    WeatherThemeEntity? value;
    switch (this) {
      case WeatherTypeEnum.Thunderstorm:
      case WeatherTypeEnum.Rain:
        value = WeatherThemeEntity(
          firstColor: blue,
          secondColor: lightBlue,
        );
        break;
      case WeatherTypeEnum.Drizzle:
      case WeatherTypeEnum.Snow:
        value = WeatherThemeEntity(
          firstColor: cyan,
          secondColor: cyanLight,
        );
        break;
      case WeatherTypeEnum.Clear:
        value = WeatherThemeEntity(
          firstColor: orange,
          secondColor: yellow,
        );
        break;
      case WeatherTypeEnum.Clouds:
      case WeatherTypeEnum.other:
        value = WeatherThemeEntity(
          firstColor: grey,
          secondColor: lightGrey,
        );
        break;
      default:
        value = WeatherThemeEntity(
          firstColor: blue,
          secondColor: lightBlue,
        );
        break;
    }
    return value;
  }
}
