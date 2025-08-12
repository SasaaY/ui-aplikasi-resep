import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_setting_model.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Bahasa'),
      ),
    );
  }
}
