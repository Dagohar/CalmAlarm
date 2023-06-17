import 'package:calmalarm/providers/alarms_provider.dart';
import 'package:calmalarm/widgets/alarm_creator_modal.dart';
import 'package:calmalarm/widgets/alarm_list_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmsPage extends StatefulWidget {
  const AlarmsPage({super.key});

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends State<AlarmsPage> {
  AlarmsProvider alarmsProvider = AlarmsProvider();

  void addNewAlarm(AlarmListElement newAlarm) {
    setState(() {
      var newList = alarmsProvider.savedAlarms.toList();
      newList.add(newAlarm);
      alarmsProvider.savedAlarms = newList;
    });
  }

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
            GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 100,
                  crossAxisCount: 1,
                ),
                itemCount: provider.savedAlarms.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [provider.savedAlarms[index], const Divider(thickness: 1.0)],
                  );
                }),
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
                            return AlarmCreatorModal(callback: addNewAlarm);
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
