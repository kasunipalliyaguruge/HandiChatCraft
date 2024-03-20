/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_18/community_page.dart';
import 'package:demo_18/edit_profile_page.dart';
import 'package:demo_18/home_page.dart';
import 'package:demo_18/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _firstName =
      ''; // Assuming you have a variable to store the user's first name

  @override
  void initState() {
    super.initState();
    // Fetch the user's first name when the widget initializes
    _fetchFirstName();
  }

  // Method to fetch the user's first name asynchronously from the appropriate collection
  Future<void> _fetchFirstName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch the first name from the appropriate collection
        DocumentSnapshot<Map<String, dynamic>> userDoc;

        // Check if the user document exists in the clients collection
        userDoc = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();

        if (!userDoc.exists) {
          // If the user document does not exist in the clients collection, fetch from the counselors collection
          userDoc = await FirebaseFirestore.instance
              .collection('counselors')
              .doc(user.uid)
              .get();
        }

        if (userDoc.exists) {
          final firstName = userDoc.data()?['firstName'];
          setState(() {
            _firstName = firstName ??
                ''; // Assign the fetched first name or an empty string if null
          });
        }
      }
    } catch (e) {
      // Handle any errors that might occur during fetching
      print('Error fetching first name: $e');
      // You can set a default name or show an error message here as well
      setState(() {
        _firstName = 'User'; // Set a default name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 45, right: 30, top: 90),
              child: Text(
                _firstName, // Display the user's first name dynamically
                style: Theme.of(context).brightness == Brightness.light
                    ? Theme.of(context)
                        .textTheme
                        .headlineMedium // Use light mode text style
                    : Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context)
                            .textTheme
                            .headlineMedium // Use medium headline style for dark mode
                        : Theme.of(context)
                            .textTheme
                            .headlineMedium, // Default to medium headline style
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 243, right: 20, top: 20),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 1, 39, 70),
                radius: 58,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
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
                          builder: (context) => EditProfilePage()));
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
                          builder: (context) => EditProfilePage()));
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
}*/

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'account_setting_page.dart';
import 'community_page.dart';
import 'edit_profile_page.dart';
import 'home_page.dart';
import 'setting_page.dart';
import 'widget/counselor_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _firstName = '';

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
            .collection('clients')
            .doc(user.uid)
            .get();

        if (!userDoc.exists) {
          userDoc = await FirebaseFirestore.instance
              .collection('counselors')
              .doc(user.uid)
              .get();
        }

        if (userDoc.exists) {
          final firstName = userDoc.data()?['firstName'];
          setState(() {
            _firstName = firstName ?? '';
          });
        }
      }
    } catch (e) {
      print('Error fetching first name: $e');
      setState(() {
        _firstName = 'User';
      });
    }
  }

  void _updateFirstName(String newName) {
    setState(() {
      _firstName = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 230, right: 40, top: 20),
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 1, 39, 70),
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 49, right: 30, top: 90),
              child: Text(
                _firstName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            /*ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        initialName: _firstName,
                        onUpdateName: _updateFirstName,
                      ),
                    ),
                  );
                },
                child: const Text('Edit Profile'),
              ),*/

            /*Container(
                padding: const EdgeInsets.only(left: 243, right: 20, top: 20),
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 1, 39, 70),
                  radius: 58,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
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
                          builder: (context) => EditProfilePage(
                                initialName: _firstName,
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
                      builder: (context) => CounselorList(
                        filteredList: [],
                      ), // Create an instance of CounselorList
                    ),
                  );
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountSettingPage()));
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
