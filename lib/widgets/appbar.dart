import 'package:calmalarm/widgets/change_theme_button.dart';
import 'package:flutter/material.dart';

class CalmalarmAppBar extends StatelessWidget with PreferredSizeWidget {
  const CalmalarmAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Calm Alarm'),
      actions: const [ChangeThemeButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
