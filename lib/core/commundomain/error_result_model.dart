import 'package:equatable/equatable.dart';

class ErrorResultModel extends Equatable {
  ErrorResultModel({
    this.errorCode,
    this.statusCode,
    this.message,
  });

  final String? errorCode;
  final int? statusCode;
  final String? message;

  String? getErrorDescription() {
    return message;
  }

  String? getErrorCodeString() {
    return errorCode;
  }

  @override
  List<Object?> get props => <Object?>[
        errorCode,
        statusCode,
        message,
      ];
}
