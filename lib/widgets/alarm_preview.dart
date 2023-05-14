import 'package:calmalarm/widgets/alarm_datetime.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AlarmPreview extends StatelessWidget {
  const AlarmPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 1000,
      axes: <RadialAxis>[
        RadialAxis(
          axisLineStyle: const AxisLineStyle(color: Colors.black38),
          minimum: 0,
          maximum: 100,
          startAngle: 180,
          endAngle: 180,
          showTicks: false,
          showLabels: false,
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 40, color: Theme.of(context).colorScheme.primary)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 270, positionFactor: 0.05, 
              widget: Text('09:53:32', style: Theme.of(context).textTheme.displayLarge)
            ),
            GaugeAnnotation(
              angle: 90, positionFactor: 0.25, 
              widget: AlarmDateTime(
                dateTime: DateTime.now(), 
                scaleFactor: 0.8,
                alignment: Alignment.center,
                rowAlignment: MainAxisAlignment.center,
              )
            )
          ],
        )
      ],
    );
  }
}
