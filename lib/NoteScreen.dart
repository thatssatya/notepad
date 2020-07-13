import 'package:flutter/material.dart';
import 'package:notepad/MainScreen.dart';
import 'Note.dart';
import 'DatabaseRW.dart';
import 'MainScreen.dart';

class NoteScreen extends StatefulWidget {
  // final Function addnote;
  // final ReadWrite rwObj;
  // NoteScreen(this.addnote, this.rwObj);
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final ipttile = TextEditingController();
  final iptcontent = TextEditingController();
  // final ReadWrite rw;
  // _NoteScreenState(this.rw);
  void doitmofo() {
    notes.add(Note(
        title: ipttile.text,
        text: iptcontent.text,
        id: DateTime.now().toString()));
    // widget.addnote(Note(
    //     title: ipttile.text,
    //     text: iptcontent.text,
    //     id: DateTime.now().toString()));
    print(DateTime.now().toString());
  }

  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {},
            visualDensity: VisualDensity.comfortable,
          ),
          IconButton(
            icon: Icon(
              Icons.fiber_pin,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: isDisabled
                ? null
                : () {
                    ReadWrite('edit').doTheOperation(
                      null,
                      Note(
                        title: ipttile.text,
                        text: iptcontent.text,
                        id: DateTime.now().toString(),
                      ),
                    );
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: ipttile,
                  maxLines: 2,
                  minLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (_) {
                    setState(() {
                      ipttile.text.isEmpty
                          ? isDisabled = true
                          : isDisabled = false;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: iptcontent,
                  minLines: 1,
                  maxLines: 50,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
