import 'package:calmalarm/providers/alarms_provider.dart';
import 'package:calmalarm/widgets/alarm_add.dart';
import 'package:calmalarm/models/alarm_data.dart';
import 'package:calmalarm/widgets/alarm_listview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmsPage extends StatefulWidget {
  const AlarmsPage({super.key});

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage> {
  AlarmsProvider alarmsProvider = AlarmsProvider();

  void addNewAlarm(AlarmData newAlarm) => alarmsProvider.addNewAlarm(newAlarm);
  void deleteExistingAlarm(int id) => alarmsProvider.deleteExistingAlarm(id);

  @override
  void initState() {
    super.initState();
    getSavedAlarms();
  }
  void getSavedAlarms() async {
    alarmsProvider.savedAlarms = await alarmsProvider.alarmsPreference.getSavedAlarms();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => alarmsProvider,
    child: Consumer<AlarmsProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            AlarmListView(savedAlarms: provider.savedAlarms, onDeleteExistingAlarm: deleteExistingAlarm),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return AlarmAdd(onAddNewAlarm: addNewAlarm);
                          });
                    },
                    child: const Text('Add new alarm'))
                ],
              ),
            )
          ],
        );
      },
    ));
}
