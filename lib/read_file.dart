import 'dart:io';

Future<List<String>> readFile(String path) {
  return File(path).readAsLines();
}

Future<File> writeFile(String path, String content) {
  return File(path).writeAsString(content);
}
