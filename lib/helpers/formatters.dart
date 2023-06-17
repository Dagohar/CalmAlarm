import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatters {
  // TO STRING
  static String dateTimeToString(DateTime dateTime) => DateFormat.yMd().format(dateTime);
  static String dateTimeToTimeOfDayString(DateTime dateTime)  => DateFormat.Hm().format(dateTime);
  static String timeOfDayToString(TimeOfDay timeOfDay)  => "${timeOfDay.hour}:${timeOfDay.minute}";

  // PARSE FROM STRING
  static DateTime dateTimeParse(String dateString) => DateFormat.yMd().parse(dateString);
  static TimeOfDay timeOfDayParse(String timeString) => TimeOfDay.fromDateTime(DateFormat.Hm().parse(timeString));
}