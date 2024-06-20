import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';

void printLog(Object? object) {
  String line = "$object";
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(line).forEach((match) => {
        if (kDebugMode)
          {
            // ignore: avoid_print
            print(match.group(0)),
          },
      });
}

void printAndSaveLog(Object? object) {
  String line = object.toString();
  // write(line);
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(line).forEach((match) => {
        if (kDebugMode)
          {
            // ignore: avoid_print
            print(match.group(0)),
          },
      });
}

Future<String> get _localPath async {
  var directory = await getExternalStorageDirectory();
  directory ??= await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/logger.txt');
}

void write(String data) async {
  final file = await _localFile;
  file.writeAsStringSync('$data\n', mode: FileMode.append);
}

void clearSavedLogs() async {
  final file = await _localFile;
  file.delete();
}

Future<void> shareFile() async {
  final file = await _localFile;
  await FlutterShare.shareFile(
    title: 'Share Logs',
    filePath: file.path,
  );
}
