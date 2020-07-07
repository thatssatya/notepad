import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
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

  doTheOperation(List<Note> n, Note note) async {
    if (opr == 'read') {
      print('Into Reading');
      final file1 = await _titleFile;
      Stream<List<int>> inputStream = file1.openRead();

      inputStream
          .transform(utf8.decoder) // Decode bytes to UTF-8.
          .transform(new LineSplitter()) // Convert stream to individual lines.
          .listen((String line) {
        // Process results.
        // print('$line: ${line.length} bytes');
        var parts = line;
        List<String> p = parts.split(' ');
        // parts.split('x');
        print('Reading Note - title: ${p[0]} & content: ${p[1]}');
        n.add(Note(title: p[0], text: p[1]));
      }, onDone: () {
        print('File is now closed.');
      }, onError: (e) {
        print(e.toString());
      });
    } else if (opr == 'write') {
      print('Into Writing');
      final file1 = await _titleFile;
      var sink1 = file1.openWrite(mode: FileMode.append);
      sink1.write('${note.title} ${note.text}\n');

      sink1.close();
      print(
          'Wrote title: ${note.title} text: ${note.text}!\nFile is now closed');
    } else if (opr == 'clean') {
      final file1 = await _titleFile;
      n.clear();
      file1.writeAsString('');
      print('DB Cleaned');
    }
    notifyListeners();
  }
}

// Future<List<Note>> readWriteRequest(ReadWrite rw) async {
//   return await rw.doTheOperation();
// }

// class Storage with ChangeNotifier {
//   final int n;
//   List<Note> notes = [];
//   Note note;
//   Storage(this.n, {this.notes: null, this.note: null});
// _StorageState createState() => _StorageState(_n);
// }

// class _StorageState extends State<Storage> with ChangeNotifier {
//   final Note _n;
//   _StorageState(this._n);

// Future<File> get _contentFile async {
//   final path = await _localPath;
//   return File('$path/content.txt');
// }

// Future<String> readTitle() async {
//   try {
//     final file = await _titleFile;
//     String titles = await file.readAsString();
//     print(titles);
//     return titles;
//   } catch (e) {
//     return 'Failed to Read File';
//   }
// }
// Future<String> readFromFile(List<Note> n) async {
//   // try {
//   final file1 = await _titleFile;
//   Stream<List<int>> inputStream = file1.openRead();

//   inputStream
//       .transform(utf8.decoder) // Decode bytes to UTF-8.
//       .transform(new LineSplitter()) // Convert stream to individual lines.
//       .listen((String line) {
//     // Process results.
//     print('$line: ${line.length} bytes');
//     var parts = line;
//     List<String> p = parts.split(' ');
//     // parts.split('x');
//     print(p[0]);

//     n.add(Note(title: p[0], text: p[1]));
//   }, onDone: () {
//     print('File is now closed.');
//   }, onError: (e) {
//     print(e.toString());
//   });
// notifyListeners();
//   final file2 = await _contentFile;
//   // while (file1 != ) {
//   String titles = await file1.readAsString();
//   String contents = await file2.readAsString();
//   print(titles);
//   print(contents);
//   // }

//   return 'Successful Read';
// } catch (e) {
//   return 'Failed to Read File';
// }
// }
// class CleanDB with ChangeNotifier {

// }

// class WriteToFile with ChangeNotifier {
//   write(Note n) async {

//   }
// }

// Future<File> writeContent(Note n) async {
//   final file = await _contentFile;
//   // Write the file
//   return file.writeAsString(n.text);
// }
// @override
// void initState() {
//   super.initState();
//   setState(() {
//     readFromFile(n)
//   });
// }

//   Widget build(BuildContext context) {
//     if (n == 1)
//       readFromFile(notes);
//     else if (n == 2)
//       writeToFile(note);
//     else if (n == 3) cleanDB();
//   }
// }
