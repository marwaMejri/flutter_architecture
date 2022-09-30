import 'package:intl/intl.dart';

extension ExtensionsOnNullableInt on int? {
  String? fromTimestampToDate() {
    if (this != null) {
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat('dd-MM-yyyy').format(_date);
    }
    return null;
  }

  String? fromTimestampToTime() {
    if (this != null) {
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat.Hms().format(_date);
    }
    return null;
  }
}
