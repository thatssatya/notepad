import 'package:flutter/material.dart';
import 'package:notepad/main.dart';
import 'MainScreen.dart';
import 'DatabaseRW.dart';
// import 'package:splashscreen/splashscreen.dart';

class InitScreen extends StatefulWidget {
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool initialReadDone = false;
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => MainScreen(),
        ));
      },
    );

    if (!initialReadDone) {
      initialReadDone = true;
      // setState(() {
      ReadWrite('read').doTheOperation(null, null);
      // });
    }

    // Navigator.of(context).pop();
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => MainScreen(),
    // ));

    // return SplashScreen(
    //   seconds: 2,
    //   backgroundColor: Theme.of(context).primaryColor,
    //   loaderColor: Theme.of(context).primaryColor,
    //   image: isDark
    //       ? Image.asset('assets/icon/icon_dark.png')
    //       : Image.asset('assets/icon/icon_light.png'),
    //   photoSize: 150,
    //   navigateAfterSeconds: MainScreen(),
    // );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        // child: Column(
        // children: <Widget>[
        //   Image.asset(isDark
        //       ? 'assets/icon/icon_dark.png'
        //       : 'assets/icon/icon_dark.png'),
        child: Text(
          'NotePad',
          style: TextStyle(fontSize: 50.0),
        ),
        //   ],
        // ),
      ),
    );
  }
}
