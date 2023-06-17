import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'formatters.dart';

class Converters {
  static AlarmListElement convertStringToAlarmListElement(String data) {
    var dataSplit = data.split(';');
    var date = Formatters.dateTimeParse(dataSplit[1]);
    var time = Formatters.timeOfDayParse(dataSplit[2]);
    return AlarmListElement(title: dataSplit[0], dateTime: date, timeOfDay: time);
  }
  static String convertAlarmListElementToString(AlarmListElement alarm) {
    return "${alarm.title};${Formatters.dateTimeToString(alarm.dateTime)};${Formatters.timeOfDayToString(alarm.timeOfDay)}";
  }
}