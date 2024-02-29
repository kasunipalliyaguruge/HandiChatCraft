import 'package:flutter/material.dart';

class LanguageChangePage extends StatefulWidget {
  const LanguageChangePage({super.key});

  @override
  _LanguageChangePageState createState() => _LanguageChangePageState();
}

class _LanguageChangePageState extends State<LanguageChangePage> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change language'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Select language'),
            trailing: DropdownButton<String>(
              value:
                  _selectedLanguage, // Set the initial value of the DropdownButton
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedLanguage =
                        value; // Update the _selectedLanguage state variable
                  });
                }
              },
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'es',
                  child: Text('Español'),
                ),
                DropdownMenuItem(
                  value: 'fr',
                  child: Text('Français'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle language change action
            },
            child: const Text(
              'Change language',
              style: TextStyle(color: Color.fromARGB(223, 233, 105, 7)),
            ),
          )
        ],
      ),
    );
  }
}
