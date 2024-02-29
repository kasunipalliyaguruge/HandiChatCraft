import 'package:flutter/material.dart';
import 'package:handichatcraft_w1953281/language_page.dart';
import 'package:handichatcraft_w1953281/notification_page.dart';

//import 'package:handicraft_profile/profile/update_profile.dart';
//import 'package:settings_screen/settings_screen.dart';

import 'settings_page.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.security),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Security',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 130),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 210),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.dark_mode),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 290),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguageChangePage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.language),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Language',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 370),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Notification',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          /*Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 450),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountSettingPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text('Notification')),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),*/
          Container(
            padding: const EdgeInsets.only(left: 50, top: 520),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(280, 55),
                backgroundColor: const Color.fromARGB(255, 221, 127, 12),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              onPressed: () {},
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      /*body: settingsScreen(
        [
          {
            "title": "General",
            "subtitle": "General settings",
            "onTap": () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            "leadingIcon": Icons.settings,
          },
          {
            "title": "Security",
            "subtitle": "Security settings",
            "onTap": () {},
            "leadingIcon": Icons.security,
          },
          {
            "title": "Notifications",
            "subtitle": "Notifications settings",
            "onTap": () {},
            "leadingIcon": Icons.notifications,
          },
          {
            "title": "About",
            "subtitle": "About settings",
            "onTap": () {},
            "leadingIcon": Icons.info,
          },
          {
            "title": "Language",
            "subtitle": "English",
            "onTap": () {},
            "leadingIcon": Icons.language,
          },
        ],
      ),*/
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        foregroundColor: const Color.fromARGB(255, 221, 127, 12),
        child: const Icon(Icons.chat_bubble),
      ),
      bottomNavigationBar: const BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          )
          ),*/
    );
  }
}
