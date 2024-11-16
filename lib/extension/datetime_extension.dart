import 'package:camping/extension/string_extension.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatToYMD() {
    return DateFormat('yyyy/MM/dd').format(
      DateTime.parse(toString()),
    );
  }

  String formatToMD() {
    return DateFormat('MM/dd').format(
      DateTime.parse(toString()),
    );
  }

  String formatToYMDBy(String? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('yyyy/MM/dd').format(
      DateTime.parse(dateTime),
    );
  }

  String toIsoFormat() {
    return toIso8601String();
  }

  bool isToday() {
    DateTime target = DateTime.now();
    return year == target.year && month == target.month && day == target.day;
  }

  String todayOrMD() => isToday() ? 'today'.locale() : formatToMD();
}
