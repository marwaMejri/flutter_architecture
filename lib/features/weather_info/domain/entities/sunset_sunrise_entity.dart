import 'package:equatable/equatable.dart';

class SunsetSunriseEntity extends Equatable {
  SunsetSunriseEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  @override
  List<Object?> get props => <Object?>[
        type,
        id,
        country,
        sunrise,
        sunset,
      ];
}
