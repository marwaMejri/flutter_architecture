import 'package:equatable/equatable.dart';

class WindInfoEntity extends Equatable {
  const WindInfoEntity({
    this.speed,
    this.deg,
  });

  final String? speed;
  final int? deg;

  @override
  List<Object?> get props => <Object?>[
        speed,
        deg,
      ];
}
