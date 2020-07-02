import 'package:flutter/material.dart';
import 'Note.dart';

class EditNote extends StatefulWidget {
  final Note note; final Function func;
  EditNote(this.note, this.func);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final ipttitle = TextEditingController();
  final iptcontent = TextEditingController();
  @override
  void initState() {
 //   ipttitle = widget.note.title.   ;
    // TODO: implement initState
    super.initState();
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
          IconButton(icon: Icon(Icons.delete, color: Colors.white,), onPressed: (){widget.func(widget.note.id); Navigator.of(context).pop();},),
          IconButton(icon: Icon(Icons.check, color: Colors.white,), onPressed: (){},),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(color: Colors.white,),
              TextFormField(
                initialValue: widget.note.title.toString(),
                maxLines: 2, minLines: 1, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),// controller: ipttitle,
                decoration: InputDecoration(labelText: 'Title', labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), ),
                onChanged: (_){},
              ),
              //  Divider(color: Colors.white,),
              TextField(
                minLines: 1, maxLines: 50, controller: iptcontent,
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
