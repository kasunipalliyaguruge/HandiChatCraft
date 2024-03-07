import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/pages/counselor_page.dart';
import 'package:handichatcraft_w1985612/pages/rating_page.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int _selectedPage;

  @override
  void initState() {
    _selectedPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('The app')),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.feedback_rounded,
                color: Colors.orange,
              ),
              label: 'feedback'),
        ],
        selectedIndex: _selectedPage,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
      body: [CounselorPage(), RatingPage()][_selectedPage],
    );
  }
}
