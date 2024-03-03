import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1985612/widget/category.dart';
import 'package:handichatcraft_w1985612/widget/counselor_list.dart';
import 'package:handichatcraft_w1985612/widget/search_box.dart';

class CounselorPage extends StatelessWidget {
  const CounselorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.orange,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_rounded),
            color: Colors.orange,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hello Anne",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: "Calistoga",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Find your Counselor",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: "Calistoga",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SearchBox(),
            const SizedBox(
              height: 10,
            ),
            const CategoryCard(),
            const SizedBox(
              height: 30,
            ),
            const CounselorList(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
