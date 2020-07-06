import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'Note.dart';
import 'MainScreen.dart';

// class Storage with ChangeNotifier {
//   final int n;
//   final List<Note> notes;
//   final Note note;
//   Storage(this.n, this.notes, this.note);
//   _StorageState createState() => _StorageState(_n);
// }

// class _StorageState extends State<Storage> with ChangeNotifier {
//   final Note _n;
//   _StorageState(this._n);
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  // disablePathProviderPlatformOverride = true;
  print(directory.path);
  return directory.path;
}

Future<File> get _titleFile async {
  final path = await _localPath;
  return File('$path/title.txt');
}

Future<File> get _contentFile async {
  final path = await _localPath;
  return File('$path/content.txt');
}

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
Future<String> readFromFile(List<Note> n) async {
  // try {
  final file1 = await _titleFile;
  Stream<List<int>> inputStream = file1.openRead();

  inputStream
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(new LineSplitter()) // Convert stream to individual lines.
      .listen((String line) {
    // Process results.
    print('$line: ${line.length} bytes');
    var parts = line;
    List<String> p = parts.split(' ');
    // parts.split('x');
    print(p[0]);

    n.add(Note(title: p[0], text: p[1]));
  }, onDone: () {
    // notifyListeners();
    print('File is now closed.');
  }, onError: (e) {
    // notifyListeners();
    print(e.toString());
  });

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
}

void cleanDB(List<Note> n) async {
  final file1 = await _titleFile;
  final file2 = await _contentFile;
  n.clear();
  file1.writeAsString('');
  file2.writeAsString('');
  print('Files Deleted');
  // notifyListeners();
}

void writeToFile(Note n) async {
  final file1 = await _titleFile;
  // final file2 = await _contentFile;
  var sink1 = file1.openWrite(mode: FileMode.append);
  sink1.write('${n.title} ${n.text}\n');

  sink1.close();
  // notifyListeners();
}

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
