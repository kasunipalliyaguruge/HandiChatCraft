import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'settings_page.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  // Variable to hold the image path
  String _imagePath = 'assets/profile.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            showPopupMenu(context);
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 124, right: 20, top: 25),
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 1, 39, 70),
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                  //child: Text('Sri Lanka',

                  //)
                ),
              ),
              Positioned(
                top: 113,
                left: 220,
                child: GestureDetector(
                  onTap: () {
                    showPopupMenu(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Colors.white,
                      ),
                      color: const Color.fromARGB(255, 233, 129, 60),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 180),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    /*boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 181, 179, 177),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4)),
                      ],*/
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Color.fromARGB(255, 233, 129, 60),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 233, 129, 60),
                                width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "First Name",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 233, 129, 60))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 260),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  /*boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 181, 179, 177),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4)),
                    ],*/
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: Color.fromARGB(255, 233, 129, 60),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 233, 129, 60),
                              width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "Last Name",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 233, 129, 60))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 340),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  /*boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 181, 179, 177),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4)),
                    ],*/
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 233, 129, 60),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 233, 129, 60),
                              width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 233, 129, 60))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 420),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 233, 129, 60),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 233, 129, 60),
                              width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "Phone No",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 233, 129, 60))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 503),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.list,
                        color: Color.fromARGB(255, 233, 129, 60),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 233, 129, 60),
                              width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "Interested In",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 233, 129, 60))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, top: 600),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 45),
                    backgroundColor: const Color.fromARGB(255, 206, 204, 202),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 4, 4), fontSize: 18),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 220, top: 600),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 45),
                    backgroundColor: const Color.fromARGB(255, 221, 127, 12),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Positioned(
                top: 113,
                left: 220,
                child: GestureDetector(
                  onTap: () {
                    showPopupMenu(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Colors.white,
                      ),
                      color: const Color.fromARGB(255, 233, 129, 60),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
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

  void showPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Edit Profile'),
                onTap: () {
                  // Close the alert dialog
                  Navigator.pop(context);
                  // Open the gallery
                  _getImageFromGallery(context);
                },
              ),
              ListTile(
                title: const Text('View Profile'),
                onTap: () {
                  // Close the alert dialog
                  Navigator.pop(context);
                  // Show the image
                  _showProfileImage(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Update the image path
      setState(() {
        _imagePath = pickedFile.path!;
      });
    }
  }

  void _showProfileImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Image'),
          content: Image.asset(_imagePath),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
