import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          // Aksi yang ingin dilakukan saat logo diklik
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/GEMAYU.png',
            width: 80.0,
            height: 80.0,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildAction('List Generus', () {
                // Aksi yang ingin dilakukan saat teks 'List Generus' diklik
              }),
              SizedBox(width: 16.0),
              _buildAction('Login', () {
                // Aksi yang ingin dilakukan saat teks 'Login' diklik
              }),
            ],
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 77, 85, 79), const Color.fromARGB(255, 205, 217, 226)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildAction(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.black, // Warna teks hitam
        decoration: TextDecoration.underline, // Garis bawah teks
      ),
    ),
  );
}

}
