import 'package:flutter/material.dart';
import 'Note.dart';

class NoteScreen extends StatefulWidget {
  final Function addnote;
  NoteScreen(this.addnote);
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final ipttile = TextEditingController();
  final iptcontent = TextEditingController();

  void doitmofo(){
    widget.addnote(Note(title: ipttile.text, text: iptcontent.text, id: DateTime.now().toString()));
    // print(DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.alarm), onPressed: (){}, visualDensity: VisualDensity.comfortable,),
          IconButton(icon: Icon(Icons.fiber_pin, color: Colors.white,), onPressed: (){},),
          IconButton(icon: Icon(Icons.check, color: Colors.white,), onPressed: (){doitmofo(); Navigator.of(context).pop();},),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(color: Colors.white,),
              TextField(
                controller: ipttile,
                maxLines: 2, minLines: 1, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                decoration: InputDecoration(labelText: 'Title', labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                onChanged: (_){},
              ),
            //  Divider(color: Colors.white,),
              TextField(
                controller: iptcontent,
                minLines: 1, maxLines: 50,
                decoration: InputDecoration(disabledBorder: InputBorder.none ,labelText: 'Content', labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              )
              ],
          ),
        ),
      ),
    );
  }
}
