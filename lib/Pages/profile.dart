import 'package:flutter/material.dart';

import '../Component/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text(
          'Gemayu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 248, 248),
            fontSize: 24,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 230, 161, 106),
                Color.fromARGB(255, 105, 57, 12),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Generus',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'assets/home.jpg',
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nama',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Futuh adif perwira'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Jenis Kelamin',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('Laki-laki'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Tempat Tanggal Lahir',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('2003-06-29'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Ayah',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('aris'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Ibu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('tuti'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Desa',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('barat 2'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Kelompok',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('kebonkaret'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Pendidikan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('D4/S1'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
                const Text(
                  'Kontak',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text('085221927740'),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
