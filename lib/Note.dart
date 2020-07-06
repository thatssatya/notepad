import 'package:flutter/material.dart';
import 'EditNote.dart';

class Note {
  final String title;
  final String text;
  final String id;
  final DateTime date;

  Note({@required this.title, this.date, this.id, this.text});
}

class NoteWidget extends StatefulWidget {
  final Function mofo, fomo;
  final Note _note;
  NoteWidget(this._note, this.mofo, this.fomo);
  _NoteWidgetState createState() =>
      _NoteWidgetState(this._note, this.mofo, this.fomo);
}

class _NoteWidgetState extends State<NoteWidget> {
  final Function mofo, fomo;
  final Note _note;
  _NoteWidgetState(this._note, this.mofo, this.fomo);
  double sideLen = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ClipRRect(
      //   key: UniqueKey(),
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(30.0),
      //   ),

      //   child:
      decoration: BoxDecoration(
        // color: Theme.of(context).accentColor,
        border: Border.all(
          // color: Colors.red,
          width: 2.0,
          color: Theme.of(context).accentColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        // focusColor: Colors.yellow,
        // hoverColor: Colors.pink,
        splashColor: Theme.of(context).cardColor,
        // highlightColor: Theme.of(context).accentColor,
        onTap: () {
          // setState(() {
          //   sideLen == 10 ? sideLen = 1 : sideLen = 10;
          //   Future.delayed(Duration(milliseconds: 700), () {
          //     sideLen == 1 ? sideLen = 10 : sideLen = 7;
          //   });
          // });

          // Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => EditNote(_note, mofo, fomo),
          ));
          // });
        },
        child: Column(
          children: <Widget>[
            ListTile(
              // contentPadding: EdgeInsets.symmetric(vertical: 1),
              title: Text(
                _note.title,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            ListTile(
              title: Text(
                _note.text,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      // ),
      // ),
      // ),
    );
  }
}
