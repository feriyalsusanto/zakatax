import 'package:flutter/material.dart';
import 'package:zakatax/util/appcolors.util.dart';

class AboutAppPage extends StatefulWidget {
  @override
  _AboutAppPageState createState() {
    return _AboutAppPageState();
  }
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/ic_logo.png',
              color: AppColors.primaryLightColor,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/ic_logo.png',
                    height: 128.0,
                    width: 128.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 4.0),
                  child: Text(
                    'Aplikasi Zakatax merupakan Aplikasi yang bertujuan untuk membantu perhitungan zakat, info-info zakat dan pencacatan pribadi zakat yang telah dilakukan.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  'Dengan fitur tambahan Alarm Zakat yang membantu kita untuk mengingatkan zakat tiap bulan sesuai dengan tanggal dan waktu yang sudah kita tentukan.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
