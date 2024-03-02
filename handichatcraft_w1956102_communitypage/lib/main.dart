import 'package:flutter/material.dart';
import 'package:handichatcraft_w1956102/communitypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Community Page',
      debugShowCheckedModeBanner: false,
      home: Communitypage(),
    );
  }
}