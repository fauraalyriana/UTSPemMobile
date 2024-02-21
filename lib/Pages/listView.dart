import 'package:flutter/material.dart';
import 'package:flutter_app_uts/Pages/profile.dart';
import '../Component/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShowDataTable extends StatefulWidget {
  const ShowDataTable({super.key});

  @override
  _ShowDataTableState createState() => _ShowDataTableState();
}

class _ShowDataTableState extends State<ShowDataTable> {
  final http.Client httpClient = http.Client();

  String dummyValue1 = 'Desa';
  String dummyValue2 = 'Semua';

  List<dynamic> _data = [];

  Future<void> _fetchData() async {
    final response =
        await httpClient.get(Uri.parse('localhost:8081/listGenerus'));
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'List Generus',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pilih Kategori:', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: dummyValue1,
                  onChanged: (value) {},
                  items: ['Kategori 3', 'Kategori 2', 'Desa']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter Desa:', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: dummyValue2,
                  onChanged: (value) {},
                  items: ['Desa 2', 'Desa 1', 'Semua']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  columns: <DataColumn>[
                    DataColumn(label: Text('No.')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('Jenis Kelamin')),
                    DataColumn(label: Text('Nama Ayah')),
                    DataColumn(label: Text('Nama Ibu')),
                    DataColumn(label: Text('Pendidikan')),
                    DataColumn(label: Text('Kontak')),
                    DataColumn(label: Text('Tanggal lahir')),
                    DataColumn(label: Text('Profil')),
                  ],
                  rows: List<DataRow>.generate(
                      _data.length,
                      (index) => DataRow(cells: <DataCell>[
                            DataCell(Text(index.toString())),
                            DataCell(Text(_data[index]['nama'])),
                            DataCell(Text(_data[index]['jeniskelamin'])),
                            DataCell(Text(_data[index]['ayah'])),
                            DataCell(Text(_data[index]['ibu'])),
                            DataCell(Text(_data[index]['pendidikan'])),
                            DataCell(Text(_data[index]['kontak'])),
                            DataCell(Text(_data[index]['ttl'])),
                            DataCell(
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(), // Mengirim data langsung ke halaman profil
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: Text('Cek'),
                              ),
                            ),
                          ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
