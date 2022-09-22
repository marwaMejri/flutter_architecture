class CustomConnectionException implements Exception {
  final int? exceptionCode;
  final String? exceptionMessage;

  CustomConnectionException({this.exceptionCode, this.exceptionMessage});
}
