import 'package:flutter/material.dart';
import '../Component/navbar.dart';


class ShowDataTable extends StatefulWidget {
  const ShowDataTable({super.key});

  @override
  _ShowDataTableState createState() => _ShowDataTableState();
}

class _ShowDataTableState extends State<ShowDataTable> {
  String dummyValue1 = 'Desa';
  String dummyValue2 = 'Semua';

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
                  columns: [
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
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('cici')),
                      DataCell(Text('Perempuan')),
                      DataCell(Text('Nono')),
                      DataCell(Text('Lin')),
                      DataCell(Text('S1')),
                      DataCell(Text('04957854')),
                      DataCell(Text('4 des 202')),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text('Cek'),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Egar')),
                      DataCell(Text('Laki-laki')),
                      DataCell(Text('Nono')),
                      DataCell(Text('Lin')),
                      DataCell(Text('S1')),
                      DataCell(Text('0324837234')),
                      DataCell(Text('4 des 2002')),
                      DataCell(
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text('Cek'),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
