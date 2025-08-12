import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/home.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_setting_model.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}
