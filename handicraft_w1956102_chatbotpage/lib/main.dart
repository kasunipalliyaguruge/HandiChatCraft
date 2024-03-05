import 'package:flutter/material.dart';
import 'package:handicraft_w1956102_chatbotpage/chatbotpage.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Chatbot Page',
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Chatbotpage(),
);
}
}