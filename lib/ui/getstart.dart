import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_assets;

class Getstart extends StatefulWidget {
  const Getstart({super.key});

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(app_assets.bgawal), fit: BoxFit.cover)
        ),
      ),
    );
  }
}