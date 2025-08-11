import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/constants/colors.dart';
import 'package:ui_rplikasi_resep_masakan/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      home: HomePage(),
    );
  }
}
