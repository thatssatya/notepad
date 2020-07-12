// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:notepad/DatabaseRW.dart';
import 'package:provider/provider.dart';
import 'Note.dart';
import 'NoteScreen.dart';
import 'theming.dart';
import 'DatabaseRW.dart';

List<Note> notes = [];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // void _deletenote(String id) {
  //   setState(() {
  //     notes.removeWhere((element) => element.id == id);
  //   });
  // }

  // void _addnote(Note nn) {
  //   setState(() {
  //     notes.add(nn);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _themeNotifier = Provider.of<ThemeNotifier>(context);
    bool _darkTheme = (_themeNotifier.getTheme()) == blackTheme;

    // final rwObj = Provider.of<ReadWrite>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 55.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Switch(
                value: _darkTheme,
                onChanged: (value) {
                  setState(() {
                    _darkTheme = value;
                  });

                  onThemeChanged(value, _themeNotifier);
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              "Notes",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            // Clean Database
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              ReadWrite('clean').doTheOperation(null, null);
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MainScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: GridView.count(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
          crossAxisCount: 2,
          mainAxisSpacing: 14.0,
          crossAxisSpacing: 14.0,
          children: notes.map((e) => NoteWidget(e)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NoteScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
