import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFFE0F2E9), // Latar belakang hijau muda
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('sate.jpg'), // Ganti dengan path gambar Anda
              SizedBox(height: 20),
              Text(
                'L\'Atelier du Chef',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'BENGKEL SI KOKI',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sudah siap memperlaya koleksi masakan di rumah? Ayo, lihat semua resep yang kami sajikan dan temukan ide-ide baru untuk setiap waktu makanmu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('See More'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}