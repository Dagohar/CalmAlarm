import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmListElement extends StatelessWidget {
  const AlarmListElement({super.key, required this.title, required this.dateTime});

  final String title;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [const Icon(Icons.alarm), Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)))), IconButton(onPressed: () => {}, icon: const Icon(Icons.edit))],
        ),
        Transform.scale(
          scale: 0.75,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.date_range),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(DateFormat.yMMMd().format(dateTime)),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.timer),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(DateFormat.Hm().format(dateTime)),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
