import 'package:flutter/material.dart';
import 'home_page.dart'; // Mengimpor halaman daftar produk

// Halaman login yang menggunakan StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Konstruktor untuk LoginPage

  @override
  _LoginPageState createState() => _LoginPageState(); // Membuat state untuk halaman ini
}

class _LoginPageState extends State<LoginPage> {
  // Kontroler untuk input username dan password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Fungsi untuk menangani proses login
  void _login() {
    final username =
        _usernameController.text; // Mengambil teks dari kontroler username
    final password =
        _passwordController.text; // Mengambil teks dari kontroler password

    // Contoh: 3 digit terakhir NIM adalah "123"
    if (username == "123" && password == "123") {
      // Jika username dan password benar, navigasi ke halaman daftar produk
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => HomePage(
                username: _usernameController.text,
              ), // Mengirim username ke halaman daftar pakaian
        ), // Menuju halaman daftar produk
      );
    } else {
      // Jika username atau password salah, tampilkan snackbar dengan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
            ], // Gradient background
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Mengatur alignment kolom ke tengah
            children: [
              // Gambar atau Ilustrasi
              Image.asset(
                'assets/upnLogo.png',
                height: 200, // Tinggi gambar
              ),
              const SizedBox(height: 24), // Jarak vertikal
              // Judul
              const Text(
                'Login', // Teks judul
                style: TextStyle(
                  fontSize: 32, // Ukuran font
                  fontWeight: FontWeight.bold, // Menebalkan teks
                  color: Colors.white, // Warna teks
                ),
              ),
              const SizedBox(height: 8), // Jarak vertikal
              const Text(
                'Login untuk mengakses lebih banyak fitur', // Teks instruksi
                style: TextStyle(
                  fontSize: 16, // Ukuran font
                  color: Colors.white70, // Warna teks
                ),
              ),
              const SizedBox(height: 32), // Jarak vertikal
              // Input Username
              TextField(
                controller: _usernameController, // Menghubungkan kontroler
                style: const TextStyle(color: Colors.white), // Warna teks input
                decoration: InputDecoration(
                  labelText: 'Username', // Label untuk input
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ), // Warna label
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white70,
                  ), // Ikon di depan input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // Sudut input melengkung
                    borderSide: BorderSide.none, // Menghilangkan garis tepi
                  ),
                  filled: true, // Mengisi latar belakang input
                  fillColor:
                      Colors.deepPurple.shade600, // Warna latar belakang input
                ),
              ),
              const SizedBox(height: 16), // Jarak vertikal
              // Input Password
              TextField(
                controller: _passwordController, // Menghubungkan kontroler
                obscureText: true, // Menyembunyikan teks input (untuk password)
                style: const TextStyle(color: Colors.white), // Warna teks input
                decoration: InputDecoration(
                  labelText: 'Password', // Label untuk input
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ), // Warna label
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white70,
                  ), // Ikon di depan input
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // Sudut input melengkung
                    borderSide: BorderSide.none, // Menghilangkan garis tepi
                  ),
                  filled: true, // Mengisi latar belakang input
                  fillColor:
                      Colors.deepPurple.shade600, // Warna latar belakang input
                ),
              ),
              const SizedBox(height: 24), // Jarak vertikal
              // Tombol Login
              ElevatedButton(
                onPressed:
                    _login, // Memanggil fungsi _login saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna latar belakang tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32, // Padding horizontal
                    vertical: 16, // Padding vertikal
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // Sudut tombol melengkung
                  ),
                ),
                child: const Text(
                  'Login', // Teks pada tombol
                  style: TextStyle(
                    fontSize: 18, // Ukuran font
                    color: Colors.deepPurple, // Warna teks
                    fontWeight: FontWeight.bold, // Menebalkan teks
                  ),
                ),
              ),
              const SizedBox(height: 16), // Jarak vertikal
              // Teks Lupa Password atau Daftar
            ],
          ),
        ),
      ),
    );
  }
}
