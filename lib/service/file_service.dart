import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> writeFile(String fileName, String writeTxt) async {
    final file = await localFile(fileName);

    // Write the file
    return file.writeAsString(writeTxt);
  }

  Future<String> readFile(String fileName) async {
    try {
      final file = await localFile(fileName);

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "";
    }
  }
}
