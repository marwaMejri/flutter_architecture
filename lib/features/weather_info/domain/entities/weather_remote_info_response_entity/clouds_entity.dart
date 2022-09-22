import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable {
  const CloudsEntity({
    this.all,
  });

  final int? all;

  @override
  List<Object?> get props => <Object?>[
        all,
      ];
}
