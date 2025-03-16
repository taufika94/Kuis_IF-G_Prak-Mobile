import 'package:app/pages/news_detail_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:flutter/material.dart';
// Mengimpor halaman detail pakaian
import 'login_page.dart'; // Mengimpor halaman login
import '../model/newsmodel.dart'; // Mengimpor model data pakaian

// Halaman untuk menampilkan daftar pakaian
class HomePage extends StatelessWidget {
  final String username; // Menyimpan username pengguna

  // Konstruktor untuk Homepage yang menerima username
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'), // Judul halaman
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
        actions: [
          // Teks selamat datang
          IconButton(
            icon: const Icon(Icons.person), // Ikon profile
            onPressed: () {
              // Navigasi kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: '$username'),
                ), // Mengarahkan ke halaman login
              );
            },
          ),
          // Tombol logout
          IconButton(
            icon: const Icon(Icons.logout), // Ikon logout
            onPressed: () {
              // Navigasi kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ), // Mengarahkan ke halaman login
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.purple.shade100,
            ], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16), // Padding di sekitar grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 16, // Jarak antar kolom
            mainAxisSpacing: 16, // Jarak antar baris
            childAspectRatio: 0.8, // Rasio aspek untuk setiap item
          ),
          itemCount: dummyNews.length, // Jumlah item yang ditampilkan
          itemBuilder: (context, index) {
            final item =
                dummyNews[index]; // Mengambil item pakaian berdasarkan indeks
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail pakaian saat item ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => NewsDetailPage(
                          item: item,
                        ), // Mengirim item ke halaman detail
                  ),
                );
              },
              child: Card(
                elevation: 8, // Bayangan pada kartu
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Sudut kartu melengkung
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start, // Mengatur alignment kolom ke kiri
                  children: [
                    // Menampilkan gambar produk
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                          16,
                        ), // Sudut atas gambar melengkung
                      ),
                      child: Image.network(
                        item.image, // Mengambil URL gambar dari model
                        height: 150, // Tinggi gambar
                        width: double.infinity, // Lebar gambar penuh
                        fit: BoxFit.cover, // Mengatur gambar agar menutupi area
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ), // Padding di sekitar teks
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start, // Mengatur alignment kolom ke kiri
                        children: [
                          // Menampilkan nama produk
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, // Menebalkan teks
                              fontSize: 16, // Ukuran font
                            ),
                          ),
                          const SizedBox(height: 4), // Jarak vertikal
                          // Menampilkan jumlah terjual
                          Text(
                            '${item.likes} likes', // Menampilkan jumlah terjual
                            style: const TextStyle(
                              fontSize: 14, // Ukuran font
                              color: Color.fromARGB(
                                255,
                                50,
                                2,
                                2,
                              ), // Warna teks
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
