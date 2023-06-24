import 'package:calmalarm/pages/navigation.dart';
import 'package:calmalarm/providers/theme_provider.dart';
import 'package:calmalarm/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }
  void getCurrentAppTheme() async {
    themeChangeProvider.darkMode = await themeChangeProvider.themePreference.getDarkMode();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => themeChangeProvider,
    child: Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'CalmAlarm', 
          theme: Styles.appThemeData(provider.darkMode, context), 
          home: const NavigationPage()
        );
      },
    ),
  );
}
