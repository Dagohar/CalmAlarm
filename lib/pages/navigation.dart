import 'package:calmalarm/pages/alarms.dart';
import 'package:calmalarm/pages/home.dart';
import 'package:calmalarm/widgets/appbar.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalmalarmAppBar(),
      body: <Widget>[
        const HomePage(),
        const AlarmsPage()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.alarm),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.alarm_add),
            label: 'Alarms',
          ),
        ],
      ),
    );
  }
}
