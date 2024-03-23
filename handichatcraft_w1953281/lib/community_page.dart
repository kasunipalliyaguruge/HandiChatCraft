import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Page'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12, top: 30),
            child: const Text(
              'Community page',
            ),
          )
        ],
      ),
    );
  }
}
