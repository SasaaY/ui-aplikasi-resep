import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_setting_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late final MenuSettingModel settingNotif;
  late final List<Map<String, dynamic>> items;

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    settingNotif = MenuSettingModel.menuSetting.firstWhere(
      (e) => e.title == "Notifikasi",
    );
    items = List<Map<String, dynamic>>.from(
      settingNotif.content?['notifikasi'] ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(settingNotif.title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SwitchListTile(
            title: Text(item['title']),
            value: item['enabled'],
            onChanged: (value) {
              setState(() {
                item['enabled'] = value;
              });
            },
          );
        },
      ),
    );
  }
}
