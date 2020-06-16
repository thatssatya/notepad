import 'package:flutter/material.dart';
import './Note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note>_notes=[
    Note(title: 'T1'), Note(title: 'T2'), Note(title: 'T3'), Note(title: 'T4')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: (
        SingleChildScrollView(
         child: Container(
           height: 400,
           child: GridView.builder(
             padding: EdgeInsets.all(10),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2, crossAxisSpacing:10, mainAxisSpacing: 10),
             itemCount: _notes.length,
             itemBuilder: (ctx, i) => NoteTile(_notes[i]),
           ),
         ),
        )
      ),
    );
  }
}

