import 'package:flutter/material.dart';
import 'package:notepad/DatabaseRW.dart';
import 'package:notepad/MainScreen.dart';
import 'Note.dart';
import 'DatabaseRW.dart';
import 'MainScreen.dart';

class EditNote extends StatefulWidget {
  final Note note;
  EditNote(this.note);

  @override
  _EditNoteState createState() => _EditNoteState(note);
}

class _EditNoteState extends State<EditNote> {
  Note n;
  _EditNoteState(this.n);
  dynamic ipttitle;
  dynamic iptcontent;
  bool isDisabled = true;
  @override
  void initState() {
    ipttitle = TextEditingController(
      text: n.title,
    ); //c
    iptcontent = TextEditingController(
      text: n.text,
    ); //c
    // implement initState
    super.initState();
  }

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
              Icons.delete,
            ),
            onPressed: () {
              ReadWrite('edit').doTheOperation(
                n.id,
                null,
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
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: isDisabled
                ? null
                : () {
                    ReadWrite('edit').doTheOperation(
                      n.id,
                      Note(
                        id: DateTime.now().toString(),
                        title: ipttitle.text,
                        text: iptcontent.text,
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
                child: TextFormField(
                  maxLines: 2,
                  minLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  controller: ipttitle,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (_) {
                    setState(() {
                      (ipttitle.text == n.title || ipttitle.text.isEmpty)
                          ? isDisabled = true
                          : isDisabled = false;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 50,
                  controller: iptcontent,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (_) {
                    setState(() {
                      (iptcontent.text == n.text)
                          ? isDisabled = true
                          : isDisabled = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
