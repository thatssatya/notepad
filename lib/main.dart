import 'package:flutter/material.dart';
import 'package:notepad/InitScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theming.dart';
import 'DatabaseRW.dart';

// import 'package:splashscreen/splashscreen.dart';
var isDark;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((prefs) {
    isDark = prefs.getBool('darkMode') ?? false;
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

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: _themeNotifier.getTheme(),
      home: InitScreen(),
    );
  }
}
