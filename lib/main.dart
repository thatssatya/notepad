// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notepad/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainScreen.dart';
import 'theming.dart';
import 'DatabaseRW.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io' show Directory;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((prefs) {
    var isDark = prefs.getBool('darkMode') ?? false;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(isDark ? blackTheme : lightTheme),
        child: ChangeNotifierProvider<ReadWrite>(
          create: (_) => ReadWrite('read'),
          child: MyApp(),
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: _themeNotifier.getTheme(),
      home: SplashScreen(),
    );
  }
}
