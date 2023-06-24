import 'package:calmalarm/extensions/dateTime_extension.dart';
import 'package:calmalarm/extensions/timeOfDay_extension.dart';
import 'package:calmalarm/models/alarm_data.dart';
import 'package:flutter/material.dart';

class AlarmAdd extends StatefulWidget {
  const AlarmAdd({super.key, required this.onAddNewAlarm});
  
  final Function(AlarmData newAlarm) onAddNewAlarm;

  @override
  State<AlarmAdd> createState() => _AlarmAddState();
}

class _AlarmAddState extends State<AlarmAdd> {
  late TextEditingController _titleController, _dateController, _timeController;
  late DateTime _date;
  late TimeOfDay _time;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleController, 
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Alarm title')
                ),
                const SizedBox(height: 10),
                TextField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () async {
                      var pickedDate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime.now(), 
                        lastDate: DateTime.now().add(const Duration(days: 365))
                      );
                      _date = pickedDate!;
                      _dateController.text = _date.toLocalString();
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Set Date')),
                const SizedBox(height: 10),
                TextField(
                    controller: _timeController,
                    readOnly: true,
                    onTap: () async {
                      var pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      _time = pickedTime!;
                      _timeController.text = _time.toLocalString();
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Set Time')),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      var newAlarm = AlarmData(
                        title: _titleController.text, 
                        dateTime: _date, 
                        timeOfDay: _time,
                        isOn: true
                      );
                      widget.onAddNewAlarm(newAlarm);
                      Navigator.pop(context);
                    },
                    child: const Text('Set Alarm'))
              ],
            )));
  }
}
