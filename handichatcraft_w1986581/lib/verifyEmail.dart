import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handichatcraft_w1986581/newPassword.dart';

class VerifyEmail extends StatelessWidget {
const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 223, 223, 1),
        title: const Text(
          'Verify Your Email',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(217, 145, 63, 8),
            fontWeight: FontWeight.bold,
            fontFamily: 'Calistoga',
          ),
        ),
        leading: const BackButton(
          color: Color.fromARGB(154, 83, 28, 1),
  
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(225, 223, 223, 1),
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                bottom: 390,
                left: 45,
                right: 45,
                child: Text(
                  'Please Enter the 4 Digit Code Sent To Your Email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(154, 83, 28, 1),
                    fontFamily: 'Lalezar',
                  ),
                ),
              ),
              Positioned(
                bottom: 470,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset('assets/verify.png', width: 150, height: 180),
                  ],
                ),),
              Positioned(
                bottom: 70,
                right: 50,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const NewPassword()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text('Verify', style: TextStyle(
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
                bottom: 280,
                left: 60,
                right: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineSmall,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineSmall,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineSmall,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.headlineSmall,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}