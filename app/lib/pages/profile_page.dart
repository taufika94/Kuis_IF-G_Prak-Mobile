import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart'; // Mengimpor halaman login


// Halaman untuk menampilkan daftar pakaian
class ProfilePage extends StatelessWidget {
  final String username; // Menyimpan username pengguna

  // Konstruktor untuk ClothesListPage yang menerima username
  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.back_hand), // ga nemu icon back
            onPressed: () {
              // Navigasi kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: '$username',)), // Mengarahkan ke halaman login
              );
            },
          ),

        ],
        title: const Text('Profile'), // Judul halaman
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
        child: Column( // Menggunakan kolom untuk menyusun elemen secara vertikal
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignment kolom ke kiri
          children: [
            Text(
                'Selamat datang, $username', // Menampilkan pesan selamat datang dengan username
                style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)), // Gaya teks
              ),
            // Judul tentang aplikasi
          ],
        ),
      ),
      );
  }
}