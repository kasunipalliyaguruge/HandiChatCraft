import 'package:flutter/material.dart';
import 'package:handichatcraft_w1953281/update_profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 45, right: 30, top: 90),
              child: const Text(
                'Name',
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 15, 5), fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 243, right: 20, top: 20),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 1, 39, 70),
                radius: 58,
                backgroundImage: AssetImage('assets/profile.png'),
                //child: Text('Sri Lanka',

                //)
              ),
            ),
            /*Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 200),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 193, 91, 23), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 106, 103, 103), width: 1.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "Edit Profile",
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(left: 320, top: 220),
              width: 60,
              height: 60,
              //decoration: BoxDecoration(
              //color: Colors.cyan,
              //borderRadius: BorderRadius.circular(15),
              //),
              child: Icon(Icons.arrow_forward_outlined),
            ),*/

            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfilePage()));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text(
                      'Edit Prodile',
                      style: TextStyle(fontSize: 16),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 290),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfilePage()));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.view_list),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text(
                      'Counselor List',
                      style: TextStyle(fontSize: 16),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 380),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text(
                      'Community Forum',
                      style: TextStyle(fontSize: 16),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 470),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Text(
                      'Setting',
                      style: TextStyle(fontSize: 16),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
