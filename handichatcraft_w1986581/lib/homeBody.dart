import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> categories = ["Batik","Handloom","Jewelry","Resin","Masks","Basket","Pottery"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Text(
                categories[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calistoga',
                  color: Color.fromARGB(154, 196, 70, 7),
                  fontSize: 14,
                ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2.0),
              height: 2,
              width: 30,
              color: selectedIndex == index ? const Color.fromARGB(154, 196, 70, 7): Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}