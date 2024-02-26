import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:handichatcraft_w1985612/pages/schedule_page.dart';

class CounselorProfile extends StatelessWidget {
  const CounselorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: primaryColor50,
      body: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 80,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    child: const Column(
                      children: <Widget>[
                        Text("Mr.saman Kumara",
                            style: TextStyle(
                                color: primaryDark,
                                fontSize: 20,
                                fontFamily: "Calistoga")),
                        Text(
                          "Specialized in batik",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: textDark,
                              fontSize: 15,
                              fontFamily: "Calistoga"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontFamily: "Calistoga",
                                fontSize: 20,
                                color: textDark36),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 170,
                    width: 350,
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                                "MR.saman kumara is a batik counselor in sri lanka.."),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(14.0),
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(right: 120, left: 120, top: 0.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShedulePage(
                              counselor: CounselorModel("MR.Saman Kumara",
                                  "Specialized in batik", ""),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Appointment",
                        style: TextStyle(
                          fontFamily: "Lalezar",
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
