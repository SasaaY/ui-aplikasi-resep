import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/menu_setting.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_setting_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/language.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String currentLanguage = "Indonesia"; // nilai awal

  @override
  Widget build(BuildContext context) {
    final setting = MenuSettingModel.menuSetting;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: setting.length,
        itemBuilder: (context, index) {
          final menu = setting[index];
          return ListTile(
            leading: Icon(menu.icon),
            title: Text(menu.title),
            trailing: menu.title == "Bahasa"
                ? Text(
                    currentLanguage,
                    style: const TextStyle(color: Colors.grey),
                  )
                : null,
            onTap: () async {
              if (menu.title == "Bahasa") {
                final result = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LanguagePage(initLanguage: currentLanguage),
                  ),
                );
                if (result != null) {
                  setState(() {
                    currentLanguage = result;

                    final langList = menu.languages;

                    langList.remove(result);
                    langList.insert(0, result);
                  });
                }
              } else {
                Navigator.push(context, menu.route!(context));
              }
            },
          );
        },
      ),
    );
  }
}
