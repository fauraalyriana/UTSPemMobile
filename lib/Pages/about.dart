import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Tentang Kami',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Aplikasi Gemayu Portal adalah platform yang bertujuan untuk '
                  'mendukung kegiatan sosial dan kegiatan generus Indramayu dalam hal pembinaan dan peramutan. '
                  'Kami berkomitmen untuk menyediakan layanan terbaik untuk kelancaran kegiatan generus.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sebagai media pusat data dan rekap perkembangan generus, platform ini didesain untuk memberikan '
                  'informasi yang akurat dan terkini. Diharapkan platform ini menjadi sarana yang efisien dalam fungsinya sebagai '
                  'platform pendataan dan pembinaan generus.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dikembangkan oleh Tim Gemayu Portal dengan tekad dan semangat untuk memberikan kontribusi '
                  'positif bagi kemajuan komunitas generus di Indramayu.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/home.png',
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
