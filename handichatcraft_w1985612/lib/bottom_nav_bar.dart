import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: Colors.orange,
          ),
          label: "Menu",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.rate_review,
            color: Colors.orange,
          ),
          label: "Rate",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            color: Colors.orange,
          ),
          label: "Chatbot",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
            color: Colors.orange,
          ),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_rounded,
            color: Colors.orange,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
