import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/language.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/notification.dart';

class MenuSettingModel {
  UniqueKey? id = UniqueKey();
  String title;
  IconData? icon;
  Route<dynamic> Function(BuildContext)? route;

  MenuSettingModel({this.id, this.title = "", this.icon, this.route});

  static List<MenuSettingModel> menuSetting = [
    MenuSettingModel(
      title: "Language",
      icon: Icons.translate,
      route: (_) => MaterialPageRoute(builder: (_) => const LanguagePage()),
    ),
    MenuSettingModel(
      title: "Notification",
      icon: Icons.notifications_none,
      route: (_) => MaterialPageRoute(builder: (_) => const NotificationPage()),
    ),
  ];
}
