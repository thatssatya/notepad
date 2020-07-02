import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Note.dart';
import 'NoteScreen.dart';
import 'theming.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Note> _notes = [];

  void _deletenote(String id) {
    setState(() {
      _notes.removeWhere((element) => element.id == id);
    });
  }

  void _addnote(Note nn) {
    setState(() {
      _notes.add(nn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _themeNotifier = Provider.of<ThemeNotifier>(context);
    bool _darkTheme = (_themeNotifier.getTheme()) == darkTheme;
    return Scaffold(
      // backgroundColor: Colors.white,
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
        // backgroundColor: Colors.black,
//        leading: Icon(Icons.note),
        title: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "Notes",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 550,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 1 / 1,
                      maxCrossAxisExtent: 150,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  children: _notes
                      .map((e) => NoteWidget(e, _deletenote, _addnote))
                      .toList()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => NoteScreen(_addnote),
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
