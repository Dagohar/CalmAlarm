import 'package:flutter/material.dart';

class CalmalarmAppBar extends StatelessWidget with PreferredSizeWidget {
  const CalmalarmAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Calm Alarm'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
