// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Chatbotpage extends StatelessWidget{
const Chatbotpage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
      child: AppBar(
         centerTitle: true,
         title: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           // ignore: prefer_const_literals_to_create_immutables
           children: [
             Image.asset(
               'lib/icons/chat-bot.png',
               height: 32,
               width: 32,
             ),
             SizedBox(height: 10),
             Text(
             'Handibot',
             style: TextStyle(
             color: Color.fromARGB(222, 222, 133, 24),
             fontWeight: FontWeight.bold,
              ),
             )
           ],
          )
         ),
       ),
      ),
    );
  }
}
