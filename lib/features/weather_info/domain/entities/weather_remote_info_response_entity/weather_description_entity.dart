import 'package:equatable/equatable.dart';

class WeatherDescriptionEntity extends Equatable {
  const WeatherDescriptionEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => <Object?>[
        id,
        main,
        description,
        icon,
      ];
}
