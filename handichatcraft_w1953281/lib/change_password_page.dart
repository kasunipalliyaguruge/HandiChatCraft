/*import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late String _oldPassword;
  late String _newPassword;
  late String _confirmNewPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                cursorColor: const Color.fromARGB(255, 202, 123, 5),
                decoration: const InputDecoration(
                  labelText: 'Old password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 202, 123, 5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 202, 123, 5)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _oldPassword = value ?? '';
                },
              ),
              TextFormField(
                cursorColor: const Color.fromARGB(255, 202, 123, 5),
                decoration: const InputDecoration(
                  labelText: 'New password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 202, 123, 5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 202, 123, 5)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPassword = value ?? '';
                },
              ),
              TextFormField(
                cursorColor: const Color.fromARGB(255, 202, 123, 5),
                decoration: const InputDecoration(
                  labelText: 'Confirm new password',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 202, 123, 5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 202, 123, 5)),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _newPassword) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmNewPassword = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();

                    // Handle change password action
                  }
                },
                child: const Text(
                  'Change password',
                  style: TextStyle(color: Color.fromARGB(223, 233, 105, 7)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangePasswordForm(),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _oldPasswordController,
            decoration: InputDecoration(labelText: 'Old Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your old password';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _newPasswordController,
            decoration: InputDecoration(labelText: 'New Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a new password';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _confirmNewPasswordController,
            decoration: InputDecoration(labelText: 'Confirm New Password'),
            obscureText: true,
            validator: (value) {
              if (value != _newPasswordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  try {
                    // Check if user exists in clients collection
                    DocumentSnapshot<Map<String, dynamic>> clientDoc =
                        await FirebaseFirestore.instance
                            .collection('clients')
                            .doc(user.uid)
                            .get();
                    if (clientDoc.exists) {
                      // Update password in clients collection
                      await clientDoc.reference.update({
                        'password': _newPasswordController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Password changed successfully')),
                      );
                      Navigator.pop(context);
                      return;
                    }

                    // Check if user exists in counselors collection
                    DocumentSnapshot<Map<String, dynamic>> counselorDoc =
                        await FirebaseFirestore.instance
                            .collection('counselors')
                            .doc(user.uid)
                            .get();
                    if (counselorDoc.exists) {
                      // Update password in counselors collection
                      await counselorDoc.reference.update({
                        'password': _newPasswordController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Password changed successfully')),
                      );
                      Navigator.pop(context);
                      return;
                    }

                    // User not found in clients or counselors collection
                    print(
                        'Error: User not found in clients or counselors collection.');
                  } catch (error) {
                    print('Error updating password: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating password')),
                    );
                  }
                }
              }
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}
