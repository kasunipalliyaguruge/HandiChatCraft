import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> with TickerProviderStateMixin {

  bool get wantKeepAlive => true;

  final String handiImage = 'assets/pdf.png';

  final List<String> batikPdf = [
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
  ];

  final List<String> handloomPdf = [
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
    '5cosc024w_ict01_mock_code.pdf',
    '5cosc024w_ict01_mock_answer.pdf',
  ];

  final List<String> resinPdf = [
    
  ];

  final List<String> masksPdf = [

  ];

  final List<String> jewelryPdf = [

  ];

  final List<String> basketPdf = [

  ];

  final List<String> potteryPdf = [

  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(154, 83, 28, 1),
        ),
      ),
      body: Column(
        children: [
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
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        batikPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 19,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        handloomPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        resinPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        masksPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        jewelryPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        basketPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: const Color.fromARGB(255, 216, 216, 216),
                      leading: ClipRRect(
                        child: Image.asset(
                          handiImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        potteryPdf[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}