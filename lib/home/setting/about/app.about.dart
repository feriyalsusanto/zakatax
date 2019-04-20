import 'package:flutter/material.dart';

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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.android,
                size: 96.0,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 4.0),
              child: Text(
                'Aplikasi Zakatax merupakan Aplikasi yang bertujuan untuk membantu perhitungan zakat, info-info zakat dan pencacatan pribadi zakat yang telah dilakukan.',
                textAlign: TextAlign.justify,
              ),
            ),
            Text(
              'Dengan fitur tambahan Alarm Zakat yang membantu kita untuk mengingatkan zakat tiap bulan sesuai dengan tanggal dan waktu yang sudah kita tentukan.',
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
