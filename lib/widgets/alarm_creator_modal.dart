import 'package:calmalarm/helpers/formatters.dart';
import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'package:flutter/material.dart';

class AlarmCreatorModal extends StatefulWidget {
  const AlarmCreatorModal({super.key, required this.callback});
  final Function(AlarmListElement newAlarm) callback;

  @override
  State<AlarmCreatorModal> createState() => _AlarmCreatorModalState();
}

class _AlarmCreatorModalState extends State<AlarmCreatorModal> {
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
                      _dateController.text = Formatters.dateTimeToString(_date);
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Set Date')),
                const SizedBox(height: 10),
                TextField(
                    controller: _timeController,
                    readOnly: true,
                    onTap: () async {
                      var pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      _time = pickedTime!;
                      _timeController.text = Formatters.timeOfDayToString(_time);
                    },
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Set Time')),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      var newAlarm = AlarmListElement(title: _titleController.text, dateTime: _date, timeOfDay: _time);
                      widget.callback(newAlarm);
                      Navigator.pop(context);
                    },
                    child: const Text('Set Alarm'))
              ],
            )));
  }
}
