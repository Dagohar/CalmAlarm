import 'package:calmalarm/models/alarm_data.dart';
import 'package:flutter/material.dart';
import 'alarm_datetime.dart';

class AlarmListView extends StatefulWidget {
  const AlarmListView({super.key, required this.savedAlarms, required this.onDeleteExistingAlarm});

  final List<AlarmData> savedAlarms;
  final Function(int id) onDeleteExistingAlarm;

  @override
  State<AlarmListView> createState() => _AlarmListViewState();
}

class _AlarmListViewState extends State<AlarmListView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 100,
        crossAxisCount: 1,
      ),
      itemCount: widget.savedAlarms.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Column(
              children: <Widget>[
                Row(
                  children: [
                    const Icon(Icons.alarm), 
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                        child: Text(
                          widget.savedAlarms[index].title, 
                          style: const TextStyle(fontWeight: FontWeight.w500)))), 
                    Switch(
                      value: widget.savedAlarms[index].isOn, 
                      onChanged: (value) => setState(() {
                        widget.savedAlarms[index].isOn = !widget.savedAlarms[index].isOn;
                      })),
                    IconButton(onPressed: () => {}, icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: () => widget.onDeleteExistingAlarm(widget.savedAlarms[index].id), 
                      icon: const Icon(Icons.delete))],
                ),
                AlarmDateTime(dateTime: widget.savedAlarms[index].fireAlarmDate)
              ],
            ),
            const Divider(thickness: 1.0)
          ],
        );
      });
  }
}