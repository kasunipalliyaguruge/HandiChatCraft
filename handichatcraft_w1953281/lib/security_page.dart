import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12, top: 30),
            child: const Text(
              'security page',
            ),
          )
        ],
      ),
    );
  }
}
