import 'package:flutter/material.dart';
import 'package:flutter_app_uts/Pages/about.dart';
import 'package:flutter_app_uts/Pages/listView.dart';
import 'package:flutter_app_uts/Pages/home.dart';
import 'package:flutter_app_uts/Pages/login.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 218, 185, 159), // Warna latar belakang
        child: ListView(
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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/profile-bg3.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('LIST GENERUS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowDataTable()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('PUSTAKA DALIL'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('PROFIL'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('TENTANG'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }
}
