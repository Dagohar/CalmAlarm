import 'package:calmalarm/widgets/alarm_datetime.dart';
import 'package:flutter/material.dart';

class AlarmListElement extends StatelessWidget {
  const AlarmListElement({super.key, required this.title, required this.dateTime, required this.timeOfDay});

  final String title;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;

  @override
  Widget build(BuildContext context) {
    final fireAlarmDate = DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour, timeOfDay.minute);
    return Column(
      children: <Widget>[
        Row(
          children: [
            const Icon(Icons.alarm), 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)))), 
            IconButton(onPressed: () => {}, icon: const Icon(Icons.edit))],
        ),
        AlarmDateTime(dateTime: fireAlarmDate)
      ],
    );
  }
}
