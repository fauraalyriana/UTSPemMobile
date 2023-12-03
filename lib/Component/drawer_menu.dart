import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Menu Item 1'),
            onTap: () {
              // Handle when menu item 1 is tapped
            },
          ),
          ListTile(
            title: Text('Menu Item 2'),
            onTap: () {
              // Handle when menu item 2 is tapped
            },
          ),
          // Add more ListTile widgets for additional menu items
        ],
      ),
    );
  }
}
