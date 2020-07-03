import 'package:flutter/material.dart';
import 'EditNote.dart';

class Note {
  final String title;
  final String text;
  final String id;
  final DateTime date;

  Note({@required this.title, this.date, this.id, this.text});
}

class NoteWidget extends StatelessWidget {
  final Function mofo, fomo;
  final Note _note;
  NoteWidget(this._note, this.mofo, this.fomo);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: UniqueKey(),
      borderRadius: BorderRadius.circular(30.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => EditNote(_note, mofo, fomo),
          ));
        },
        child: Card(
          // color: Colors.grey[850],
          child: ListTile(
            title: Text(_note.title),
          ),
        ),
      ),
    );

    // return InkWell(
    //   // splashColor: Colors.black,
    //   onTap: () {
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (_) => EditNote(_note, mofo, fomo),
    //     ));
    //   },
    //   child: Container(
    //     padding: EdgeInsets.all(15),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: Center(
    //       child: Text(
    //         _note.title,
    //       ),
    //     ),
    //   ),
    // );
  }
}
