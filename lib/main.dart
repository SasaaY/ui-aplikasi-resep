import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/screens/home_page.dart';
import 'package:ui_rplikasi_resep_masakan/screens/splash_screens.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: SeeMore(),
    );
  
  }
}
