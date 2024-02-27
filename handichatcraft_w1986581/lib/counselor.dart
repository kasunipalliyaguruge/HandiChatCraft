import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/forgotPassword.dart';
import 'package:handichatcraft_w1986581/home.dart';

class Counselor extends StatefulWidget {
  const Counselor({super.key});

  @override
  State<Counselor> createState() => _ClientState();
}

class _ClientState extends State<Counselor> {
  bool isSignupScreen = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(55),
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
          tileMode: TileMode.clamp)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [          
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSignupScreen = false;
                    });
                  },
                  child: Column(
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Calistoga',
                          color: Color(0xFF5F3709),
                        ),
                      ),
                  if(!isSignupScreen)     
                      Container(
                        height: 2,
                        width: 100,
                        color: const Color(0xFFAF803A),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSignupScreen = true;
                    });
                  },
                  child: Column(
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Calistoga',
                          color: Color(0xFF5F3709),
                        ),
                      ),
                  if(isSignupScreen)    
                      Container(
                        height: 2,
                        width: 100,
                        color: const Color(0xFFAF803A),
                      )
                    ],
                  ),
                )
              ],
            ),
            if (!isSignupScreen)
            Container(
              margin: const EdgeInsets.only(top: 190),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.lock,
                          color:  Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked, 
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        }
                      ),
                      const Text(
                        "Remember password",
                        style: TextStyle(
                          color: Color(0xFFA65911),
                          fontSize: 15,
                          fontFamily: 'Calistoga',
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 70,
                    right: 50,
                    left: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 140.0, right: 40.0, left: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Home()));
                        },
                        child: Container(
                          height: 59,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(231, 211, 118, 3),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign In',
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
                  Positioned(
                    bottom: 50,
                    right: 50,
                    left: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const ForgotPassword()));
                        },
                        child: const Center(
                          child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFA65911),
                                fontSize: 16,
                                fontFamily: 'Calistoga',
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                  Container(
                     width: 500,
                     margin: const EdgeInsets.only(bottom: 10),
                     child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xFFA65911),
                          fontSize: 16,
                          fontFamily: 'Calistoga',
                        ),
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              color: Color(0xFF70573F),
                              fontSize: 16,
                              fontFamily: 'Calistoga',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            ),
            if (isSignupScreen)
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Telephone Number",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.folder_special,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Specialized In",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Create Password",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFFD19C4C),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFAF803A)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),       
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isChecked, 
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        }
                      ),
                      const Text(
                        "Remember password",
                        style: TextStyle(
                          color: Color(0xFFA65911),
                          fontSize: 15,
                          fontFamily: 'Calistoga',
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 30,
                    right: 50,
                    left: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0,bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Home()));
                        },
                        child: Container(
                          height: 59,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(231, 211, 118, 3),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
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
                  Container(
                    width: 500,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFFA65911),
                          fontSize: 16,
                          fontFamily: 'Calistoga',
                        ),
                        children: [
                          TextSpan(
                            text: " Sign In",
                            style: TextStyle(
                              color: Color(0xFF70573F),
                              fontSize: 16,
                              fontFamily: 'Calistoga',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),    
        ]),
      ),
    );
  }
}
