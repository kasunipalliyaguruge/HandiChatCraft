import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/firebase_api.dart';
import 'package:push_notifications/home.dart';
import 'package:push_notifications/page/home_screen.dart';
import 'package:push_notifications/page/notification_screen.dart';

import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notifications',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route:(context) => const NotificationScreen()
    //    '/': (context) =>  NotificationView(),
      },
    );
  }
}