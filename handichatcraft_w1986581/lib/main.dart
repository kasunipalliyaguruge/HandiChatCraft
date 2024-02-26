import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/introduction.dart';
import 'package:handichatcraft_w1986581/welocme.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      routes: {
        '/INtroduction':(context) => const Introduction(),
      },
    );
  }
}
