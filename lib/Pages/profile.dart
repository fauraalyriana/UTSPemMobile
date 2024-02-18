import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Component/navbar.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});


  @override
  State<StatefulWidget> createState() => _ProfilePage();

}

class _ProfilePage extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'Gemayu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 248, 248),
            fontSize: 24,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
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

      body: Container(
        
      ),

    );
  }


}