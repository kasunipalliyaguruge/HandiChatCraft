import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'account_setting_page.dart';
import 'community_page.dart';
import 'update_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fname = '';

  @override
  void initState() {
    super.initState();
    _fetchFirstName();
  }

  Future<void> _fetchFirstName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> userDoc;
        userDoc = await FirebaseFirestore.instance
            .collection('Clients')
            .doc(user.uid)
            .get();

        if (!userDoc.exists) {
          userDoc = await FirebaseFirestore.instance
              .collection('Counselors')
              .doc(user.uid)
              .get();
        }

        if (userDoc.exists) {
          final fName = userDoc.data()?['FirstName'];
          setState(() {
            fname = fName ?? '';
          });
        }
      }
    } catch (e) {
      print('Error fetching first name: $e');
      setState(() {
        fname = 'User';
      });
    }
  }

  void _updateFirstName(String newName) {
    setState(() {
      fname = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Profile',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color.fromARGB(154, 196, 70, 7),
            fontFamily: 'Calistoga',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 190, right: 40, top: 50),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 1, 39, 70),
                radius: 70,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 49, right: 30, top: 150),
              child: Text(
                fname,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 260),
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
                          builder: (context) => EditProfilePage(
                                initialName: fname,
                                onUpdateName: _updateFirstName,
                              )));
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
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(154, 196, 70, 7),
                        fontFamily: 'Calistoga',
                      ),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 350),
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
                          builder: (context) => EditProfilePage(
                                initialName: 'John Doe',
                                onUpdateName: (String) {},
                              )));
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(154, 196, 70, 7),
                        fontFamily: 'Calistoga',
                      ),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 440),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CommunityPage()));
                },
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(154, 196, 70, 7),
                        fontFamily: 'Calistoga',
                      ),
                    )),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 530),
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
                          builder: (context) => AccountSettingPage()));
                },
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
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(154, 196, 70, 7),
                        fontFamily: 'Calistoga',
                      ),
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
