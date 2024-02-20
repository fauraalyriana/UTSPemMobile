import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_uts/Pages/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app_uts/Component/navbar.dart';

import 'package:flutter_app_uts/Pages/login.dart';
import 'package:flutter_app_uts/Pages/listView.dart';

final List<String> _educationList = ['SD', 'SMP', 'SMA'];
final List<String> _villageList = ['Barat 1', 'Barat 2', 'Barat 3'];
final List<String> _groupList = ['Sukra 1', 'Sukra 2', 'Sukra 3'];
final List<String> _genderList = ['Laki-laki', 'Perempuan'];

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc();
  }

  @override
  void dispose() {
    _registerBloc.close();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  String _selectedEducation = _educationList.first;
  String _selectedVillage = _villageList.first;
  String _selectedGroup = _groupList.first;
  String _selectedGender = _genderList.first;

  File? _image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _registerBloc,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Gemayu',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 248, 248),
                fontSize: 24),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 230, 161, 106),
                  Color.fromARGB(255, 105, 57, 12)
                ],
              ),
            ),
          ),
        ),
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShowDataTable()),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const Center(
                    child: Text(
                      'Silahkan Mengisi Data Generus Anda',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nama';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tanggal Lahir',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        controller: TextEditingController(
                          text: '${_selectedDate.toLocal()}'.split(' ')[0],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _fatherController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ayah',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nama ayah';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _motherController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ibu',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nama ibu';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedEducation,
                    items: _educationList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedEducation = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pendidikan',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedVillage,
                    items: _villageList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedVillage = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Desa',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedGroup,
                    items: _groupList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGroup = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kelompok',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: _selectedGender,
                    items: _genderList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGender = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Jenis Kelamin',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _contactController,
                    decoration: const InputDecoration(
                      labelText: 'Kontak',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi kontak';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _getImage();
                    },
                    child: _image != null
                        ? Image.file(
                            _image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey[200],
                            child: const Icon(Icons.add_a_photo),
                          ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _registerBloc.add(
                          RegisterButtonPressed(
                            name: _nameController.text,
                            birthDate: _selectedDate,
                            fatherName: _fatherController.text,
                            motherName: _motherController.text,
                            education: _selectedEducation,
                            village: _selectedVillage,
                            group: _selectedGroup,
                            gender: _selectedGender,
                            contact: _contactController.text,
                            image: _image,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      primary: const Color.fromARGB(255, 145, 99, 82),
                    ),
                    child:
                        const Text('Submit', style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class _RegisterPageState extends State<RegisterPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _fatherController = TextEditingController();
//   final TextEditingController _motherController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();

//   DateTime _selectedDate = DateTime.now();

//   String _selectedEducation = _educationList.first;
//   String _selectedVillage = _villageList.first;
//   String _selectedGroup = _groupList.first;
//   String _selectedGender = _genderList.first;

//   File? _image;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _getImage() async {
//     final picker = ImagePicker();

//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   // @override
//   // Widget build(BuildContext context) {

    
//   // }
// }
