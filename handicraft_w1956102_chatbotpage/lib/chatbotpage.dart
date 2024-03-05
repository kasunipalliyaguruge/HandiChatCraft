// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Chatbotpage extends StatelessWidget{
const Chatbotpage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'lib/icons/bot.png',
              height: 30,
              width: 30,
            ),
            SizedBox(height: 5),
            Text(
            'Handibot',
            style: TextStyle(
            color: Color.fromARGB(222, 222, 133, 24),
            fontWeight: FontWeight.bold,
             ),
            ),
          ],
        )
     ),
);
}
}
