import 'package:calmalarm/extensions/dateTime_extension.dart';
import 'package:flutter/material.dart';

class AlarmDateTime extends StatelessWidget {
  const AlarmDateTime({
    super.key,
    required this.dateTime,
    this.scaleFactor = 0.75,
    this.alignment = Alignment.centerLeft,
    this.rowAlignment = MainAxisAlignment.start
  });
  
  final double scaleFactor;
  final DateTime dateTime;
  final Alignment alignment;
  final MainAxisAlignment rowAlignment;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleFactor,
      alignment: alignment,
      child: Row(
        mainAxisAlignment: rowAlignment,
        children: [
          Row(
            children: [
              const Icon(Icons.date_range),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(dateTime.toLocalString()),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.timer),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(dateTime.toTimeOfDayString()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
