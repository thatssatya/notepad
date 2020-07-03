import 'package:flutter/material.dart';
import 'Note.dart';

class EditNote extends StatefulWidget {
  final Note note;
  final Function del, add;
  EditNote(this.note, this.del, this.add);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
//  Note get hola{return widget.note;}
//  final Note nnn = hola;
  dynamic ipttitle;
  dynamic iptcontent;
  @override
  void initState() {
    ipttitle = TextEditingController(text: widget.note.title);
    iptcontent = TextEditingController(text: widget.note.text);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {},
            visualDensity: VisualDensity.comfortable,
          ),
          IconButton(
            icon: Icon(
              Icons.fiber_pin,
              // color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              // color: Colors.white,
            ),
            onPressed: () {
              widget.del(widget.note.id);
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.check,
              // color: Colors.white,
            ),
            onPressed: () {
              widget.del(widget.note.id);
              widget.add(Note(
                  id: DateTime.now().toString(),
                  title: ipttitle.text,
                  text: iptcontent.text));
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
                child: TextFormField(
                  //  initialValue: widget.note.title.toString(),
                  maxLines: 2,
                  minLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      fontSize: 30),
                  controller: ipttitle,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //onChanged: (_){},
                ),
              ),
              //  Divider(color: Colors.white,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  //initialValue: widget.note.text.toString(),
                  minLines: 1,
                  maxLines: 50,
                  controller: iptcontent,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none, labelText: 'Content',
                    // labelStyle: TextStyle(color: Colors.white)),
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              //  Divider(color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
