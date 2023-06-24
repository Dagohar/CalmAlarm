import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toLocalString() {
    return DateFormat.yMd().format(this);
  }
  String toTimeOfDayString() {
    return DateFormat.Hm().format(this);
  }
}