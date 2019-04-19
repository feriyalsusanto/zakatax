import 'package:flutter/material.dart';
import 'package:zakatax/home/menu/infozakat/info.page.dart';
import 'package:zakatax/home/menu/zakatfitrah/fitrah.page.dart';
import 'package:zakatax/home/menu/zakatmaal/menu.page.dart';

import 'catatzakat/catatzakat.page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Menu Zakat',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              splashColor: Colors.blue,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 72.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          'assets/ic_wheat.png',
                          height: 32.0,
                          width: 32.0,
                        ),
                      ),
                      Text(
                        'Zakat Fitrah',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ZakatFitrahPage();
                }));
              },
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              splashColor: Colors.blue,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 72.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          'assets/ic_chest.png',
                          height: 32.0,
                          width: 32.0,
                        ),
                      ),
                      Text(
                        'Zakat Maal',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ZakatMaalPage();
                }));
              },
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              splashColor: Colors.blue,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 72.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          'assets/ic_faq.png',
                          height: 32.0,
                          width: 32.0,
                        ),
                      ),
                      Text(
                        'Info Zakat',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return InfoZakatPage();
                }));
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
              child: Text(
                'Pencatatan Zakat',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              splashColor: Colors.blue,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 72.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Image.asset(
                          'assets/ic_notepad.png',
                          height: 32.0,
                          width: 32.0,
                        ),
                      ),
                      Text(
                        'Catat Bukti Zakat',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CatatZakatPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
