import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/introduction.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(231, 161, 161, 161),
              Color.fromARGB(255, 233, 185, 124), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                top: 75,
                left: 85,
                right: 30,
                child: Text(
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 48,
                    color: Color.fromARGB(217, 145, 63, 8),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calistoga',
                  ),
                ),
              ),
              const Positioned(
                bottom: 240,
                left: 50,
                right: 0,
                child: Text(
                  'HandiChatCraft',
                  style: TextStyle(
                    fontSize: 55,
                    color: Color.fromARGB(154, 196, 70, 7),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Aladin',
                  ),
                ),
              ),
              Positioned(
                bottom: 390,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', width: 250, height: 230),
                  ],
                ),
              ),
              Positioned(
                bottom: 70,
                right: 50,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Introduction()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Lalezar',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}