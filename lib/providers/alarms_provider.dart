import 'dart:math';
import 'package:calmalarm/shared_preferences/alarms_preference.dart';
import 'package:calmalarm/models/alarm_data.dart';
import 'package:flutter/material.dart';

class AlarmsProvider with ChangeNotifier {
  AlarmsPreference alarmsPreference = AlarmsPreference();

  List<AlarmData> _savedAlarms = <AlarmData>[];
  List<AlarmData> get savedAlarms => _savedAlarms;
  set savedAlarms(List<AlarmData> value) {
    _savedAlarms = value;
    notifyListeners();
  }

  void addNewAlarm(AlarmData newElement) {
    // LIMIT ALARMS COUNT TO 50 ELEMENTS
    if(_savedAlarms.length >= 50) return;

    // SET NEW ID FOR THE ALARM
    newElement.id = Random().nextInt(1000);
    while(_savedAlarms.any((element) => element.id == newElement.id)) {
      newElement.id = Random().nextInt(1000);
    }

    _savedAlarms.add(newElement);
    alarmsPreference.setSavedAlarms(_savedAlarms);
    notifyListeners();
  }
  
  void deleteExistingAlarm(int id) {
    _savedAlarms.removeWhere((element) => element.id == id);
    alarmsPreference.setSavedAlarms(_savedAlarms);
    notifyListeners();
  }
}
