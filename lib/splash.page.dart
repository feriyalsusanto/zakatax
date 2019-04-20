import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zakatax/home/home.page.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() {
    return _SplashScreenPageState();
  }
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _createDirectory(),
        builder: (context, snapshot) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.android,
                    size: 128.0,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32.0, bottom: 4.0),
                    child: Text(
                      'Loading Zakatax. . .',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: LinearProgressIndicator(),
                    padding: EdgeInsets.symmetric(horizontal: 64.0),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _createDirectory() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String path = appDirectory.path + '/' + 'zakatax';
    Directory dir = await Directory(path).create(recursive: true);
    print(dir.path);
    if (await dir.exists())
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));

    return dir;
  }
}
