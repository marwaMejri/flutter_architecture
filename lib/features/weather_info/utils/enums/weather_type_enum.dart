import 'package:flutter_architecture/core/utils/values/colors.dart';
import 'package:flutter_architecture/features/weather_info/utils/weather_theme.dart';

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
  WeatherTheme? toWeatherTheme() {
    WeatherTheme? value;
    switch (this) {
      case WeatherTypeEnum.Thunderstorm:
      case WeatherTypeEnum.Rain:
        value = WeatherTheme(
          firstColor: blue,
          secondColor: lightBlue,
        );
        break;
      case WeatherTypeEnum.Drizzle:
      case WeatherTypeEnum.Snow:
        value = WeatherTheme(
          firstColor: cyan,
          secondColor: cyanLight,
        );
        break;
      case WeatherTypeEnum.Clear:
        value = WeatherTheme(
          firstColor: orange,
          secondColor: yellow,
        );
        break;
      case WeatherTypeEnum.Clouds:
      case WeatherTypeEnum.other:
        value = WeatherTheme(
          firstColor: grey,
          secondColor: lightGrey,
        );
        break;
      default:
        value = WeatherTheme(
          firstColor: blue,
          secondColor: lightBlue,
        );
        break;
    }
    return value;
  }
}
