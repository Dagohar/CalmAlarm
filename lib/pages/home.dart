import 'package:calmalarm/widgets/alarm_preview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Next alarm in:', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          const AlarmPreview()
        ],
      )
    );
  }
}
