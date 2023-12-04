import 'package:flutter/material.dart';
import 'navbar.dart'; // Import komponen DrawerMenu

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(), // Tambahkan drawer menu ke dalam Scaffold
      appBar: AppBar(
        title: Text(
          'Gemayu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 43, 41, 41),
            fontSize: 24
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 230, 161, 106), Color.fromARGB(255, 105, 57, 12)],
            ),
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/body-bg.jpg'), // Ganti dengan path gambar background Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(139, 69, 19, 0.7), 
                  borderRadius: BorderRadius.circular(15.0), 
                ),
                child: Text(
                  'Hai Selamat Datang di Gemayu Portal',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20), // Spasi vertikal
              Image.asset(
                'assets/home.png', 
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  // Aksi yang diambil ketika tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Membuat tombol oval
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Yuk Masukin Data Generus Kamu',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
