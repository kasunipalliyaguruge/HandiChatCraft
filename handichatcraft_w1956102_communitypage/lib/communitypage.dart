import 'package:flutter/material.dart';
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
              text: "Rectangle 2 - Click Here",
              onTap: () {
                launchURL('https://craftscouncil.gov.lk/');
              }),
          _buildRectangle(
              text: "Rectangle 3 - Click Here",
              onTap: () {
                launchURL('https://craftscouncil.gov.lk/');
              }),
          _buildRectangle(
              text: "Rectangle 4 - Click Here",
              onTap: () {
                launchURL('https://craftscouncil.gov.lk/');
              }),
          _buildRectangle(
              text: "Rectangle 5 - Click Here",
              onTap: () {
                launchURL('https://craftscouncil.gov.lk/');
              }),
        ],
      ),
    );
  }
  
  Widget _buildRectangle({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(232, 134, 83, 5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

