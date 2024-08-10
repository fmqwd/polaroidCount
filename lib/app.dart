import 'package:flutter/material.dart';
import 'package:polaroid_count/page/home_page/home_page.dart';
import 'package:polaroid_count/utils/setting_utils.dart';
import 'package:polaroid_count/value/string.dart';

import 'data/sqlite/data_base.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  MaterialColor _themeColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _loadThemeColor();
    _initializeDatabase();
  }

  Future<void> _loadThemeColor() async {
    MaterialColor color = await SettingUtils.getThemeColor();
    setState(() => _themeColor = color);
  }

  Future<void> _initializeDatabase() async {
    DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: flutterTitle,
      theme: ThemeData(primarySwatch: _themeColor),
      home: const HomePage(title: homePageTitle));
}
