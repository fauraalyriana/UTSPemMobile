import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'GEMAYU PORTAL',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('Pusat Data Generus Indramayu'),
            currentAccountPicture: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/GEMAYU.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/profile-bg3.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('LIST GENERUS'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('PUSTAKA DALIL'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('PROFIL'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('TENTANG'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
