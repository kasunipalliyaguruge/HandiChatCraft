import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Security',
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Navigate to change password page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordPage1()),
                );
              },
            ),
            ListTile(
              title: Text('Enable Two-Factor Authentication'),
              onTap: () {
                // Toggle 2FA setting
                if (!TwoFactorAuthentication.isEnabled) {
                  TwoFactorAuthentication.enable();
                } else {
                  TwoFactorAuthentication.disable();
                }
                // You can add more logic here to handle 2FA state change
              },
            ),
            Divider(),
            Text(
              'Privacy Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              title: Text('Manage Privacy Controls'),
              onTap: () {
                // Navigate to manage privacy controls page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyControlsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Data Sharing Preferences'),
              onTap: () {
                // Navigate to data sharing preferences page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataSharingPreferencesPage()),
                );
              },
            ),
            Divider(),
            Text(
              'Device Security',
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              title: Text('Manage Device Permissions'),
              onTap: () {
                // Navigate to manage device permissions page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DevicePermissionsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Remote Device Management'),
              onTap: () {
                // Navigate to remote device management page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RemoteDeviceManagementPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordPage1 extends StatelessWidget {
  const ChangePasswordPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to change the password
            Navigator.pop(context);
            // You can add more logic here to handle password change
          },
          child: const Text('Change Password'),
        ),
      ),
    );
  }
}

class TwoFactorAuthentication {
  static bool isEnabled = false;

  static void enable() {
    // Logic to enable 2FA
    isEnabled = true;
  }

  static void disable() {
    // Logic to disable 2FA
    isEnabled = false;
  }
}

class PrivacyControlsPage extends StatelessWidget {
  const PrivacyControlsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Privacy Controls'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to manage privacy controls
            Navigator.pop(context);
            // You can add more logic here to handle privacy controls
          },
          child: const Text('Manage Privacy Controls'),
        ),
      ),
    );
  }
}

class DataSharingPreferencesPage extends StatelessWidget {
  const DataSharingPreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Sharing Preferences'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to manage data sharing preferences
            Navigator.pop(context);
            // You can add more logic here to handle data sharing preferences
          },
          child: const Text('Manage Data Sharing Preferences'),
        ),
      ),
    );
  }
}

class DevicePermissionsPage extends StatelessWidget {
  const DevicePermissionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Permissions'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic to manage device permissions
            Navigator.pop(context);
            // You can add more logic here to handle device permissions
          },
          child: const Text('Manage Device Permissions'),
        ),
      ),
    );
  }
}

class RemoteDeviceManagementPage extends StatelessWidget {
  const RemoteDeviceManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Device Management'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic for remote device management
            Navigator.pop(context);
            // You can add more logic here to handle remote device management
          },
          child: const Text('Remote Device Management'),
        ),
      ),
    );
  }
}
