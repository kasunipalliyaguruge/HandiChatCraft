

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/introduction.dart';
import 'package:handichatcraft_w1986581/welocme.dart';
import 'package:device_preview/device_preview.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      scrollBehavior: MyCustomScrollBehavior(),
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

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
  };
}
