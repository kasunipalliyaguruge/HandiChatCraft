import 'package:flutter/material.dart';

//import 'change_password_page.dart';
//import 'language_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _notifications = true;
  bool _newsletters = true;
  bool _specialOffers = true;
  bool _betaProgram = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Receive notifications'),
            value: _notifications,
            onChanged: (value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Receive newsletters'),
            value: _newsletters,
            onChanged: (value) {
              setState(() {
                _newsletters = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Receive special offers'),
            value: _specialOffers,
            onChanged: (value) {
              setState(() {
                _specialOffers = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Participate in Beta Program'),
            value: _betaProgram,
            onChanged: (value) {
              setState(() {
                _betaProgram = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
