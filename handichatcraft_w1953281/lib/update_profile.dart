import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  final String initialName; // Define initialName parameter
  final Function(String) onUpdateName; // Define onUpdateName parameter

  const EditProfilePage({
    Key? key,
    required this.initialName,
    required this.onUpdateName,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _imagePath = 'assets/profile.png';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  late String _firstName = '';
  late String _lastName = '';
  late String _email = '';
  late String _phoneNumber = '';
  late String _interestedIn = '';
  late String _specializedIn = '';
  bool _isLoading = true;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _interestedInController = TextEditingController();
  final _specializedInController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
    _firstNameController.text = widget.initialName; // Set initial name
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _interestedInController.dispose();
    _specializedInController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    _user = _auth.currentUser!;
    DocumentSnapshot<Map<String, dynamic>> doc;
    if (_user != null) {
      doc = await _firestore.collection('clients').doc(_user.uid).get();
      if (doc.exists) {
        setState(() {
          _firstName = doc['firstName'] ?? '';
          _lastName = doc['lastName'] ?? '';
          _email = doc['email'] ?? '';
          _phoneNumber = doc['phoneNumber'] ?? '';
          _interestedIn = doc['interestedIn'] ?? '';
          _isLoading = false;
        });
      } else {
        doc = await _firestore.collection('counselors').doc(_user.uid).get();
        if (doc.exists) {
          setState(() {
            _firstName = doc['firstName'] ?? '';
            _lastName = doc['lastName'] ?? '';
            _email = doc['email'] ?? '';
            _phoneNumber = doc['phoneNumber'] ?? '';
            _specializedIn = doc['specializedIn'] ?? '';
            _isLoading = false;
          });
        }
      }
      _lastNameController.text = _lastName;
      _emailController.text = _email;
      _phoneNumberController.text = _phoneNumber;
      _interestedInController.text = _interestedIn;
      _specializedInController.text = _specializedIn;
    }
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final clientDoc = _firestore.collection('clients').doc(_user.uid);
      final counselorDoc = _firestore.collection('counselors').doc(_user.uid);

      if (_interestedIn.isNotEmpty &&
          await clientDoc.get().then((doc) => doc.exists)) {
        await clientDoc.update({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'email': _emailController.text,
          'phoneNumber': _phoneNumberController.text,
          'interestedIn': _interestedInController.text,
        });
      } else if (_specializedIn.isNotEmpty &&
          await counselorDoc.get().then((doc) => doc.exists)) {
        await counselorDoc.update({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'email': _emailController.text,
          'phoneNumber': _phoneNumberController.text,
          'specializedIn': _specializedInController.text,
        });
      }

      // Update the name using setState
      setState(() {
        _firstName = _firstNameController.text;
      });

      // Call onUpdateName to update the name
      widget.onUpdateName(_firstNameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopupMenu(context);
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 124, right: 20, top: 25),
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 1, 39, 70),
                            radius: 60,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'User Details:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 233, 129, 60),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 233, 129, 60),
                                      width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 129, 60))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        if (_interestedIn.isNotEmpty)
                          TextFormField(
                            controller: _interestedInController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 233, 129, 60),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 233, 129, 60),
                                        width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 1.0)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: 'Interested In',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 233, 129, 60))),
                          ),
                        if (_specializedIn.isNotEmpty)
                          TextFormField(
                            controller: _specializedInController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 233, 129, 60),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 233, 129, 60),
                                        width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 1.0)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: 'Specialized In',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 233, 129, 60))),
                          ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: _saveChanges,
                              child: Text('Save'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _saveProfilePicture(String imagePath) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${_user.uid}.jpg');
      UploadTask uploadTask = ref.putFile(File(imagePath));
      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      await _firestore.collection('users').doc(_user.uid).update({
        'profile_picture': imageUrl,
      });
      setState(() {
        _imagePath = imagePath;
      });
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
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
      // Save the profile picture
      _saveProfilePicture(pickedFile.path!);
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

class ImagePickerPage extends StatelessWidget {
  final String imagePath;
  final Function(String) onSaveImage;

  const ImagePickerPage({
    Key? key,
    required this.imagePath,
    required this.onSaveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.file(File(imagePath))),
          ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                onSaveImage(pickedFile.path);
                Navigator.pop(context);
              }
            },
            child: Text('Choose a new image'),
          ),
        ],
      ),
    );
  }
}
