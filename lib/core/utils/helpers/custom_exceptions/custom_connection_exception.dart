class CustomConnectionException implements Exception {
  CustomConnectionException({this.exceptionCode, this.exceptionMessage});

  final int? exceptionCode;
  final String? exceptionMessage;
}
