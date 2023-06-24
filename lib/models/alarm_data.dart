import 'package:calmalarm/extensions/dateTime_extension.dart';
import 'package:calmalarm/extensions/string_extension.dart';
import 'package:calmalarm/extensions/timeOfDay_extension.dart';
import 'package:flutter/material.dart';

class AlarmData {
  AlarmData({this.id = -1, required this.title, required this.dateTime, required this.timeOfDay, 
    required this.isOn});

  late int id;
  final String title;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;
  late bool isOn;

  late DateTime fireAlarmDate = DateTime(
      dateTime.year, 
      dateTime.month, 
      dateTime.day, 
      timeOfDay.hour, 
      timeOfDay.minute
  );

  /// Convert Alarm Data to string format saved by the Alarms Preference.
  String toDataString() {
    return '$id;$title;${dateTime.toLocalString()};${timeOfDay.toLocalString()};$isOn';
  }
}

class AlarmDataFactory {
  /// Create Alarm Data from the data string given by the Alarms Preference.
  static AlarmData createAlarmDataFromString(String data) {
    var dataSplit = data.split(';');

    return AlarmData(id: int.parse(dataSplit[0]), title: dataSplit[1], 
      dateTime: dataSplit[2].parseDateTime(), 
      timeOfDay: dataSplit[3].parseTimeOfDay(), 
      isOn: dataSplit[4].parseBool());
  }
}
