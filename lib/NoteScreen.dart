import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Note.dart';
import 'DatabaseRW.dart';

class NoteScreen extends StatefulWidget {
  final Function addnote;
  final ReadWrite rwObj;
  NoteScreen(this.addnote, this.rwObj);
  @override
  _NoteScreenState createState() => _NoteScreenState(rwObj);
}

class _NoteScreenState extends State<NoteScreen> {
  final ipttile = TextEditingController();
  final iptcontent = TextEditingController();
  final ReadWrite rw;
  _NoteScreenState(this.rw);
  void doitmofo() {
    widget.addnote(Note(
        title: ipttile.text,
        text: iptcontent.text,
        id: DateTime.now().toString()));
    print(DateTime.now().toString());
  }

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
            onPressed: () {
              doitmofo();
              setState(() {
                rw.opr = 'write';
                rw.doTheOperation(
                  null,
                  Note(
                    title: ipttile.text,
                    text: iptcontent.text,
                    id: DateTime.now().toString(),
                  ),
                );
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(
                  // color: Colors.white,
                  ),
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
                  onChanged: (_) {},
                ),
              ),
              //  Divider(color: Colors.white,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: iptcontent,
                  minLines: 1, maxLines: 50,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).accentColor,
                    ),
                  ),
                  // labelStyle: TextStyle(color: Colors.white)),
                  // style: TextStyle(color: Colors.white),
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
