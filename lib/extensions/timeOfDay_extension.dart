import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String toLocalString() {
    return '${this.hour.toString().padLeft(2, "0")}:${this.minute.toString().padLeft(2, "0")}';
  }
}