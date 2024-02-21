import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/counselor_page.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          leading: const Icon(
            Icons.account_circle_rounded,
            size: 35,
            color: Colors.orange,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CounselorPage()),
            );
          },
        ),
      ),
    );
  }
}
