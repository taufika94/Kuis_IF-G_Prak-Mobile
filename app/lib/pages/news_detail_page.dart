import 'package:flutter/material.dart';
import '../model/newsmodel.dart'; // Mengimpor model data pakaian

// Halaman detail untuk menampilkan informasi pakaian
class NewsDetailPage extends StatefulWidget {
  final NewsModel item; // Model pakaian yang akan ditampilkan

  const NewsDetailPage({Key? key, required this.item})
    : super(key: key); // Konstruktor untuk ClothesDetailPage

  @override
  _NewsDetailPage createState() => _NewsDetailPage(); // Membuat state untuk halaman ini
}

class _NewsDetailPage extends State<NewsDetailPage> {
  String? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'), // Menampilkan nama produk di AppBar
        backgroundColor: const Color.fromARGB(
          255,
          159,
          131,
          204,
        ), // Warna latar belakang AppBar
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
        child: SingleChildScrollView(
          // Membuat konten scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Mengatur alignment kolom ke kiri
              children: [
                // Menampilkan gambar produk
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Sudut gambar melengkung
                  child: Image.network(
                    widget.item.image, // Mengambil URL gambar dari model
                    width: double.infinity, // Lebar gambar penuh
                    height: 300, // Tinggi gambar
                    fit: BoxFit.cover, // Mengatur gambar agar menutupi area
                  ),
                ),
                const SizedBox(height: 16), // Jarak vertikal
                // Menampilkan nama produk
                Text(
                  widget.item.title,
                  style: const TextStyle(
                    fontSize: 24, // Ukuran font
                    fontWeight: FontWeight.bold, // Menebalkan teks
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.item.description,
                  style: const TextStyle(
                    fontSize: 20, // Ukuran font
                    // Menebalkan teks
                  ),
                ),
                const SizedBox(height: 8), // Jarak vertikal
                Row(
                  children: [
                    Text(
                      '${widget.item.likes} Likes', // Menampilkan harga produk
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        setState(() {
                          //item.likes++;// errror
                        });
                        Colors.red;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Jarak vertikal
                // Menampilkan total harga
                const SizedBox(height: 24), // Jarak vertikal
                // Tombol Konfirmasi Pesanan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
