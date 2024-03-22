import 'package:flutter/material.dart';
import 'package:handichatcraft_w1956102_communitypage/pages/notes.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class Communitypage extends StatelessWidget {
  const Communitypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Community Page',
          style: TextStyle(
            color: Color.fromARGB(222, 222, 133, 24),
            fontWeight: FontWeight.bold,
            fontFamily: 'Calistoga',
            fontSize: 25
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          _buildRectangle(
              text: "National Crafts Council - Click Here",
              onTap: () {
                launchURL('https://craftscouncil.gov.lk/');
              }),
          _buildRectangle(
              text: "Sri Lanka Export Development Board - Click Here",
              onTap: () {
                launchURL('https://www.srilankabusiness.com');
              }), 
          _buildRectangle(
              text: "Lak Shilpa - Click Here",
              onTap: () {
                launchURL('https://lakshilpa.com');
              }),
          _buildRectangle(
              text: "Laksala - Click Here",
              onTap: () {
                launchURL('http://laksalasl.weebly.com');
              }),
          _buildRectangle(
              text: "Happy Market - Click Here",
              onTap: () {
                launchURL('https://happymarket.lk/');
              }),
              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.only(right: 80, left: 80),
                child: ElevatedButton(
                  onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Notes(),
                          ));
                      },
                  style: ButtonStyle(
                    shape:MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(231, 211, 118, 3)
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 5))
                      ),
                  child: const Text(
                  'Notes',
                  style: TextStyle(
                    color: Color.fromARGB(222, 255, 255, 255),
                    fontFamily: 'Lalezar',
                    fontSize: 25,
                  ),
                 )
               ),
           )
        ],
      ),
    );
  }
  
  Widget _buildRectangle({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(232, 203, 161, 97),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Calistoga'
            ),
        ),
      ),
    );
  }
  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

