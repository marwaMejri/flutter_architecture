import 'package:intl/intl.dart';

extension ExtensionsOnNullableInt on int? {
  String? fromTimestampToDate() {
    if (this != null) {
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat('yyyy-MM-dd').format(_date);
    }
    return null;
  }
}
