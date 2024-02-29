import 'package:flutter/material.dart';

//import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings_page.dart';

//import 'profile/theme/dark_mode_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',

      // Profile page

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SettingsPage(),
    );
  }
}
