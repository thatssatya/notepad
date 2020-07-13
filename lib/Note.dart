import 'package:flutter/material.dart';
import 'EditNote.dart';

class Note {
  final String title;
  String text;
  final String id;
  final DateTime date;

  Note({@required this.title, this.date, this.id, this.text});
}

class NoteWidget extends StatefulWidget {
  final Note _note;
  NoteWidget(this._note);
  _NoteWidgetState createState() => _NoteWidgetState(this._note);
}

class _NoteWidgetState extends State<NoteWidget> {
  final Note _note;
  _NoteWidgetState(this._note);
  double sideLen = 10;
  bool tog = false;

  @override
  Widget build(BuildContext context) {
    var p = _note.id.split(' ');
    String date = p[0];
    var q = p[1].split('.');
    String time = q[0].substring(0, q[0].length - 3);
    // print('${date} and ${time}');
    return Container(
      // height: 500.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Theme.of(context).accentColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: InkWell(
        onLongPress: () {},

        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),

        // focusColor: Colors.yellow,
        // hoverColor: Colors.pink,
        splashColor: Theme.of(context).cardColor,
        // highlightColor: Theme.of(context).accentColor,

        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EditNote(_note),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: ListTile(
                    // contentPadding: EdgeInsets.symmetric(vertical: 1),
                    title: Text(
                      _note.title,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(1.0),
                  height: 67.0,
                  // padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      _note.text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18.0),
                    ),

                    // trailing: Checkbox(value: null, onChanged: null),
                  ),
                ),
              ],
            ),
            Container(
              // padding: EdgeInsets.fromWindowPadding(, devicePixelRatio),
              child: ListTile(
                // contentPadding: EdgeInsets.only(top: 7.0),
                title: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                trailing: Text(
                  date,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
