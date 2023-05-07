import 'dart:developer';

import 'package:calmalarm/pages/alarms.dart';
import 'package:calmalarm/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

final pages = {
  'Home': const Tuple2<IconData, Widget>(Icons.alarm, HomePage()), 
  'Alarms': const Tuple2<IconData, Widget>(Icons.alarm_add, AlarmsPage())
};
var currentPageIndex = 0;

class CalmalarmNavBar extends StatefulWidget {
  const CalmalarmNavBar({super.key});

  @override
  State<CalmalarmNavBar> createState() => _CalmalarmNavBarState();
}

class _CalmalarmNavBarState extends State<CalmalarmNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => pages[pages.keys.elementAt(currentPageIndex)]!.item2
            )
          );
        });
      },
      selectedIndex: currentPageIndex,
      destinations: <Widget>[
        for(var key in pages.keys) 
        NavigationDestination(
          icon: Icon(pages[key]!.item1), 
          label: key
        )
      ]
    );
  }
}
