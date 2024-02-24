import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/client.dart';
import 'package:handichatcraft_w1986581/forgotPassword.dart';

class Role extends StatelessWidget {
  const Role({super.key});

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
                top: 90,
                left: 40,
                right: 30,
                child: Text(
                  'What is your role?',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(217, 145, 63, 8),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calistoga',
                  ),
                ),
              ),
              Positioned(
                bottom: 510,
                left: 0,
                right: 200,
                child: Column(
                  children: [
                    Image.asset('assets/client.png', width: 80, height: 80,),
                  ],
                ),
              ),
              Positioned(
                bottom: 380,
                left: 0,
                right: 200,
                child: Column(
                  children: [
                    Image.asset('assets/counselor.png', width: 80, height: 80,),
                  ],
                ),
              ),
              Positioned(
                bottom: 350,
                right: 15,
                left: 110,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const ForgotPassword()));
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          'Counselor', 
                          style: TextStyle(
                            color: Color(0xE87E500B),
                            fontSize: 20,
                            fontFamily: 'Calistoga',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 480,
                right: 15,
                left: 110,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Client()));
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          'Client',
                          style: TextStyle(
                            color: Color(0xE87E500B),
                            fontSize: 20,
                            fontFamily: 'Calistoga',
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