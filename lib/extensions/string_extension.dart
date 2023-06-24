import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
  DateTime parseDateTime() {
    return DateFormat.yMd().parse(this);
  }
  TimeOfDay parseTimeOfDay() {
    return TimeOfDay.fromDateTime(DateFormat.Hm().parse(this));
  }
}