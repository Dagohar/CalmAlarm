import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'package:flutter/material.dart';

class AlarmsPage extends StatefulWidget {
  const AlarmsPage({super.key});

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage> {
  final alarms = <AlarmListElement>[
    AlarmListElement(title: 'To work', dateTime: DateTime.parse('2023-05-15 07:15:00')),
    AlarmListElement(title: 'To school', dateTime: DateTime.parse('2023-05-16 09:35:00')),
    AlarmListElement(title: 'To work', dateTime: DateTime.parse('2023-05-17 07:00:00')),
    AlarmListElement(title: 'To work', dateTime: DateTime.parse('2023-05-18 07:00:00')),
    AlarmListElement(title: 'To work', dateTime: DateTime.parse('2023-05-19 07:15:00')),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 100,
        crossAxisCount: 1,
      ),
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            alarms[index],
            const Divider(thickness: 1.0)
          ],
        );
      });
  }
}
