import 'package:calmalarm/shared_preferences/alarms_preference.dart';
import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'package:flutter/material.dart';

class AlarmsProvider with ChangeNotifier {
  AlarmsPreference alarmsPreference = AlarmsPreference();

  List<AlarmListElement> _savedAlarms = <AlarmListElement>[];
  List<AlarmListElement> get savedAlarms => _savedAlarms;
  set savedAlarms(List<AlarmListElement> value) {
    _savedAlarms = value;
    alarmsPreference.setSavedAlarms(value);
    notifyListeners();
  }
}
