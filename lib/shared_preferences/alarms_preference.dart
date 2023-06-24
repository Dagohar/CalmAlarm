import 'package:calmalarm/models/alarm_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmsPreference {
  static const SAVEDALARMS_LIST = "SavedAlarms_List";

  setSavedAlarms(List<AlarmData> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final alarmsData = <String>[];
    for (var alarm in value) {
      alarmsData.add(alarm.toDataString());
    }

    prefs.setStringList(SAVEDALARMS_LIST, alarmsData);
  }

  Future<List<AlarmData>> getSavedAlarms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedAlarmsData = prefs.getStringList(SAVEDALARMS_LIST)!;

    final alarms = <AlarmData>[];
    for (var rowData in savedAlarmsData) {
      try {
        alarms.add(AlarmDataFactory.createAlarmDataFromString(rowData));
      }
      on FormatException catch(_) {
        savedAlarmsData.remove(rowData);
        prefs.setStringList(SAVEDALARMS_LIST, savedAlarmsData);
        return await getSavedAlarms();
      }
    }

    return alarms;
  }
}
