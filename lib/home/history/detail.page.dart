import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zakatax/home/history/photoviewer.page.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';

class HistoryDetailPage extends StatefulWidget {
  HistoryDetailPage(this.data);

  Map<String, dynamic> data;

  @override
  _HistoryDetailPageState createState() {
    return _HistoryDetailPageState();
  }
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail History'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Tanggal Zakat',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                widget.data['date'] == null ? '-' : widget.data['date'],
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Text(
              'Nama Yayasan Penerima',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                widget.data['name'],
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Text(
              'Nominal Zakat',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                'Rp ${NumberFormatUtil.currencyFormat(int.parse(widget.data['total']))}',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Text(
              'Bukti Zakat',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhotoViewerPage(widget.data['image']);
                }));
              },
              child: Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                height: 240.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                alignment: Alignment.center,
                child: Image.file(
                  File(widget.data['image']),
                  height: 240.0,
                  width: 1000.0,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
