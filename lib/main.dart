import 'package:flutter/material.dart';
import 'package:zakatax/splash.page.dart';
import 'package:zakatax/util/appcolors.util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppColors.primaryColors,
          backgroundColor: AppColors.primaryColors,
          canvasColor: AppColors.primaryColors),
      home: SplashScreenPage(),
    );
  }
}
