import 'package:equatable/equatable.dart';

class MainWeatherInfoEntity extends Equatable {
  const MainWeatherInfoEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  final String? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  @override
  List<Object?> get props =>
      <Object?>[temp, feelsLike, tempMin, tempMax, pressure, humidity];
}
