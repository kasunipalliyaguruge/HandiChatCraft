import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/home.dart';

class NewPassword extends StatelessWidget {
const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 223, 223, 1),
        title: const Text(
          'Create New Password',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(217, 145, 63, 8),
            fontWeight: FontWeight.bold,
            fontFamily: 'Calistoga',
          ),
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(225, 223, 223, 1),
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                bottom: 420,
                left: 45,
                right: 45,
                child: Text(
                  'Your New Password Must Be Different from Previously Used Password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(154, 83, 28, 1),
                    fontFamily: 'Lalezar',
                  ),
                ),
              ),
              Positioned(
                bottom: 530,
                left: 20,
                right: 0,
                child: Column(
                  children: [
                    Image.asset('assets/new.png', width: 150, height: 180),
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
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Home()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text('Save', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Lalezar',
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 290,
                left: 20,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'New Password'
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 220,
                left: 20,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password'
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