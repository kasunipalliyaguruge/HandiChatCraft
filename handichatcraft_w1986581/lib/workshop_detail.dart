import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/home.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class Workshops extends StatefulWidget {
  const Workshops({super.key});

  @override
  State<Workshops> createState() => _WorkshopsState();
}

class _WorkshopsState extends State<Workshops> with TickerProviderStateMixin {

  final List<String> images = [
    'assets/BatikWorkshop1.jpg',
    'assets/BatikWorkshop2.jpg',
    'assets/BatikWorkshop3.jpg',
    'assets/BatikWorkshop4.jpg',
    'assets/BatikWorkshop5.jpg',
    'assets/BatikWorkshop6.jpg',
    'assets/BatikWorkshop7.jpg',
    'assets/BatikWorkshop8.jpg',
    'assets/w3.png',
  ];

  final List<String> handloom = [
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
    'assets/w1.png',
  ];

  final List<String> resin = [
    'assets/w3.png',
    'assets/w3.png',
    'assets/w3.png',
  ];

  final List<String> masks = [

  ];

  final List<String> jewelry = [

  ];

  final List<String> basket = [

  ];

  final List<String> pottery = [
    'assets/BatikWorkshop2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: const Color.fromARGB(154, 83, 28, 1),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Home()));
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelStyle: const TextStyle(
                  fontFamily: 'Calistoga',
                ),
                labelPadding: const EdgeInsets.only(right: 16.0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.only(bottom: 6),
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(text: "Batik"),
                  Tab(text: "Handloom"),
                  Tab(text: "Resin"),
                  Tab(text: "Masks"),
                  Tab(text: "Jewelry"),
                  Tab(text: "Basket"),
                  Tab(text: "Pottery"),
                ]
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 660,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: images.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.fill,
                          ),             
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: handloom.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(handloom[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: resin.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(resin[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: masks.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(masks[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: jewelry.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(jewelry[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: basket.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(basket[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                        itemCount: pottery.length, 
                  itemBuilder: (context, index) {
                    return InstaImageViewer(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(pottery[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}