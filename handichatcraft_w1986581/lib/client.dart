import 'package:flutter/material.dart';

class Client extends StatefulWidget {
  const Client({super.key});

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  bool isSignupScreen = true;

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
              margin: const EdgeInsets.only(top: 100),
              child: const Column(
                children: [
                  Padding(
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
                  Padding(
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
                ]),
            ),
            if (isSignupScreen)
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Column(
                children: [
                  Padding(
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
                  Padding(
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
                  Padding(
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(
                          Icons.thumb_up,
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
                        hintText: "Interested In",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Calistoga',
                          color: Color(0xFFB1A4A4),
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                  Padding(
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
                ],
              ),
            ),    
        ]),
      ),
    );  
  }
}