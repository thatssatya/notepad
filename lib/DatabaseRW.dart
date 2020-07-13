import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'Note.dart';
import 'MainScreen.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory.path);
  return directory.path;
}

Future<File> get _titleFile async {
  final path = await _localPath;
  return File('$path/title.txt');
}

class ReadWrite with ChangeNotifier {
  String opr;
  ReadWrite(this.opr);
  String key = 'fGFGqweFvfgFVGv21^&%23e@#';

  void writeToFile(List<Note> n) async {
    final file1 = await _titleFile;
    var sink1 = file1.openWrite(mode: FileMode.append);
    print('Into writing files');
    String title, content;
    for (int i = 0; i < n.length; ++i) {
      title = n[i].title.replaceAll('\n', '#@\t@#');
      content = n[i].text.replaceAll('\n', '#@\t@#');
      // print('after replacing - $s');
      print('Writing $title $content ${n[i].id}');

      sink1.write('$title$key$content$key${n[i].id}\n');
    }
    print('New Files Written');
    sink1.close();
  }

  void readFromFile() async {
    print('Into Reading files');
    final file1 = await _titleFile;
    Stream<List<int>> inputStream = file1.openRead();

    inputStream.transform(utf8.decoder).transform(new LineSplitter()).listen(
        (String line) {
      var parts = line;
      List<String> p = parts.split(key);
      // print(p);
      p[0] = p[0].replaceAll('#@\t@#', '\n');
      p[1] = p[1].replaceAll('#@\t@#', '\n');
      // print(p);
      print('Reading Note - title: ${p[0]} & content: ${p[1]} & id: ${p[2]}');
      notes.add(Note(
        title: p[0],
        text: p[1],
        id: p[2],
      ));
    }, onDone: () {
      print('File is now closed.');
    }, onError: (e) {
      print(e.toString());
    });
  }

  void cleanFile() async {
    print('Into Cleaning DB');
    final file1 = await _titleFile;
    // n.clear();
    file1.writeAsString('');
    print('DB Cleaned');
  }

  doTheOperation(String id, Note note) {
    if (opr == 'read') {
      readFromFile();
    } else if (opr == 'edit') {
      print('Into Editing Notes');
      if (id != null) notes.removeWhere((element) => element.id == id);
      if (note != null) {
        List<Note> t = [note];
        t.addAll(notes);
        notes = t;
        // t.clear();
      }
      cleanFile();
      // notes.sort((b, a) => a.id.compareTo(b.id));
      writeToFile(notes);
    } else if (opr == 'clean') {
      notes.clear();
      cleanFile();
    }
    notifyListeners();
  }
}

// else if (opr == 'add') {
// print('Into Adding Notes');
// notes.add(note);
// write([note]);
// final file1 = await _titleFile;
// var sink1 = file1.openWrite(mode: FileMode.append);
// sink1.write('${note.title} ${note.text}\n');
// sink1.close();
// print(
//     'Wrote title: ${note.title} text: ${note.text}!\nFile is now closed');
// }
