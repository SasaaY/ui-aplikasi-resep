import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_setting_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = MenuSettingModel.menuSetting;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Hello world'),
      ),
    );
    ;
  }
}
