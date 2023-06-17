import 'package:calmalarm/helpers/converters.dart';
import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmsPreference {
  static const SAVEDALARMS_LIST = "SavedAlarms_List";

  setSavedAlarms(List<AlarmListElement> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final alarmsData = <String>[];
    for (var alarm in value) {
      alarmsData.add(Converters.convertAlarmListElementToString(alarm));
    }

    prefs.setStringList(SAVEDALARMS_LIST, alarmsData);
  }

  Future<List<AlarmListElement>> getSavedAlarms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedAlarmsData = prefs.getStringList(SAVEDALARMS_LIST)!;

    final alarms = <AlarmListElement>[];
    for (var rowData in savedAlarmsData) {
      alarms.add(Converters.convertStringToAlarmListElement(rowData));
      print(rowData);
    }

    return alarms;
  }
}
