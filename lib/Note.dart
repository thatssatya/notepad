import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Note{
  final String id;
  final String title;
  final String content;

  Note({@required this.title, this.content, this.id});
}

class NoteTile extends StatelessWidget {
  final Note nn;
  NoteTile(this.nn);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GridTile(
        child: Text(nn.title, textAlign: TextAlign.center,),
      ),
    );
  }
}
