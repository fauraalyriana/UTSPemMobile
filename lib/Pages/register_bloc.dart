import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

// Event
abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String name;
  final DateTime birthDate;
  final String fatherName;
  final String motherName;
  final String education;
  final String village;
  final String group;
  final String gender;
  final String contact;
  final File? image;

  RegisterButtonPressed({
    required this.name,
    required this.birthDate,
    required this.fatherName,
    required this.motherName,
    required this.education,
    required this.village,
    required this.group,
    required this.gender,
    required this.contact,
    this.image,
  });
}

// State
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}

// BLoC
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(super.initialState);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        // Data yang akan dikirim ke API
        final Map<String, dynamic> data = {
          'nama': event.name,
          'ttl': event.birthDate.toString(), // Ubah DateTime menjadi String
          'ayah': event.fatherName,
          'ibu': event.motherName,
          'desa': event.village,
          'kelompok': event.group,
          'jeniskelamin': event.gender,
          'pendidikan': event.education,
          'kontak': event.contact,
        };

        final String apiUrl =
            'http://195.35.32.223:8081/addGenerus'; // Sesuaikan dengan alamat API Anda

        // Membuat request multipart
        var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

        // Menambahkan data form
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        // Menambahkan file gambar jika ada
        if (event.image != null) {
          var imageStream = http.ByteStream(event.image!.openRead());
          var length = await event.image!.length();

          var multipartFile = http.MultipartFile(
              'fileImage', imageStream, length,
              filename: event.image!.path.split('/').last);

          request.files.add(multipartFile);
        }

        // Mengirim request dan mendapatkan respon
        final http.StreamedResponse response = await request.send();

        // Periksa respon dari API
        if (response.statusCode == 200) {
          // Jika berhasil, kirim state RegisterSuccess
          yield RegisterSuccess();
        } else {
          // Jika gagal, kirim state RegisterFailure dengan pesan kesalahan dari API
          final responseData = await response.stream.bytesToString();

          yield RegisterFailure(error: "error");
        }
      } catch (error) {
        // Jika terjadi kesalahan selama proses, kirim state RegisterFailure dengan pesan kesalahan
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}
