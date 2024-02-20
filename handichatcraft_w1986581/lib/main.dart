import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/introduction.dart';
import 'package:handichatcraft_w1986581/welocme.dart';

void main() {
  runApp(
    const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      routes: {
        '/INtroduction':(context) => const Introduction(),
      },
    );
  }
}
