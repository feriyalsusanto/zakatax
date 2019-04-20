import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() {
    return _AboutUsPageState();
  }
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
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
                'Aplikasi Zakatax di buat untuk memenuhi Tugas Akhir (Skripsi) tahun 2019.',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Informasi Mahasiswa',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                'NIM : ',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                'Nama : ',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.0),
              child: Text(
                'Prodi : ',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
