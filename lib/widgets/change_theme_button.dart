import 'package:calmalarm/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      icon: Icon(themeProvider.darkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        themeProvider.darkMode = !themeProvider.darkMode;
      },
    );
  }
}
