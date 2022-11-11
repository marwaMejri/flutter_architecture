import 'package:equatable/equatable.dart';


class CoordinateEntity extends Equatable {
  const CoordinateEntity({
    this.lon,
    this.lat,
  });

  final double? lon;
  final double? lat;

  @override
  List<Object?> get props => <Object?>[
        lon,
        lat,
      ];
}
