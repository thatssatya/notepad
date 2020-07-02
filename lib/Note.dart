import 'package:flutter/material.dart';
import 'EditNote.dart';
import 'NoteScreen.dart';

class Note{
  final String title;
  final String text;
  final String id;
  final DateTime date;

  Note({@required this.title, this.date, this.id, this.text});
}

class NoteWidget extends StatelessWidget {
  final Function mofo;
  final Note _note;
  NoteWidget(this._note, this.mofo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => EditNote(_note, mofo),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black),
        child: Center(
          child: Text(_note.title, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
