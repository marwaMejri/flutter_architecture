import 'package:equatable/equatable.dart';

class WindInfoEntity extends Equatable {
  WindInfoEntity({
    this.speed,
    this.deg,
  });

  final double? speed;
  final int? deg;

  @override
  List<Object?> get props => <Object?>[
        speed,
        deg,
      ];
}
