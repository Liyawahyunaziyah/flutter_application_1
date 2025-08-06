import 'package:flutter/material.dart';

void main() {
  runApp(const CatDoneApp());
}

class CatDoneApp extends StatelessWidget {
  const CatDoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF928BC5), // Warna ungu seperti di gambar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon buku dengan kucing - placeholder icon
            Container(
              width: 100,
              height: 100,
              child: Icon(Icons.book, size: 80, color: Colors.white), // Ganti dengan icon kustom jika ada
            ),
            const SizedBox(height: 20),

            const Text(
              'CATDONE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol Login ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF928BC5),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
