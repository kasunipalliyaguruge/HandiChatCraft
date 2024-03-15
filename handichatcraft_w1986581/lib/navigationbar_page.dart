import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex  = 0;

  List pages = [
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: Container(
        height: 62,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 236),
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width*.024),
          itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: const EdgeInsets.only(
                  right: 12,
                  left: 12,
                ),
                width: size.width*.128,
                height: index == _currentIndex ? size.width*.014:0,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width*.080,
                color:Colors.orange,
              ),
              SizedBox(height: size.width*.03),
           ],
          ),
          ),
        ),
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home,
  Icons.feedback_rounded,
  Icons.chat,
  Icons.calendar_month,
  Icons.person,
];