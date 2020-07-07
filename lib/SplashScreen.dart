import 'package:flutter/material.dart';
import 'MainScreen.dart';
import 'DatabaseRW.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool initialReadDone = false;
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 1, milliseconds: 300),
      () {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => MainScreen(),
        ));
      },
    );
    final rwObj = Provider.of<ReadWrite>(context);

    if (!initialReadDone) {
      initialReadDone = true;
      setState(() {
        rwObj.doTheOperation(notes, null);
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'NotePad',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
