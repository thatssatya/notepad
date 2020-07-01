import 'package:flutter/material.dart';
import 'EditNote.dart';
import 'Note.dart';
import 'NoteScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Note>_notes=[
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
    Note(title: 'HOloacjsjndsckms'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
//        leading: Icon(Icons.note),
        title: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text("Notes", style: TextStyle(fontWeight: FontWeight.w500),),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5,),
            Divider(color: Colors.white30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 550,
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 1/1, maxCrossAxisExtent: 150, crossAxisSpacing: 15, mainAxisSpacing: 15),
                children: _notes.map((e) => NoteWidget(e)).toList()
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => NoteScreen(),
        ));},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
