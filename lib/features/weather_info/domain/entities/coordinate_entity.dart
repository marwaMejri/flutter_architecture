import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  CoordinateEntity({
    this.lon,
    this.lat,
  });

  final double? lon;
  final double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

  @override
  List<Object?> get props => <Object?>[
        lon,
        lat,
      ];
}
