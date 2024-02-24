import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/role.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/intro.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 242, 234, 223), BlendMode.softLight),
          ),
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
                left: 50,
                right: 20,
                child: Text(
                  'Supporting handicraft industries in Sri Lanka',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(217, 129, 78, 42),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Calistoga',
                  ),
                ),
              ),
              const Positioned(
                bottom: 380,
                left: 50,
                right: 50,
                child: Text(
                  'The handicraft industry is a diverse and creative sector that involves the production of handmade items using various skills and traditional techniques.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(163, 72, 40, 0),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almendra',
                  ),
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Role()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Next', 
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