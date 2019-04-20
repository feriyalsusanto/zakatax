import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DirectoryPathUtil {
  static getDirectoryPath() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = appDirectory.path + '/' + 'zakatax';
    return path;
  }
}
