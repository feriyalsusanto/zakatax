import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zakatax/home/home.page.dart';
import 'package:zakatax/util/appcolors.util.dart';

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
              color: AppColors.primaryColors,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/ic_logo.png',
                    height: 256.0,
                    width: 256.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24.0, bottom: 4.0),
                    child: Text(
                      'Loading Zakatax. . .',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
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
