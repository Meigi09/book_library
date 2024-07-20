import 'package:book_library/screens/register_book.dart';
import 'package:book_library/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Text('M E N U'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Books'),
            onTap: () {
              // Handle Books tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Register A Book'),
            onTap: () {
              // Handle Settings tap
              Navigator.pop(context);Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterBook()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings tap
              Navigator.pop(context);Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Handle About tap
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
