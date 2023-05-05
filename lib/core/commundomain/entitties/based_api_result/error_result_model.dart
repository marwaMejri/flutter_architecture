import 'package:equatable/equatable.dart';

class ErrorResultModel extends Equatable {
  const ErrorResultModel({
    this.statusCode,
    this.message,
  });

  final int? statusCode;
  final String? message;

  @override
  List<Object?> get props => <Object?>[
        statusCode,
        message,
      ];
}
