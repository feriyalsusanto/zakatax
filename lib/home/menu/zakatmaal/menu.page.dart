import 'package:flutter/material.dart';
import 'package:zakatax/home/menu/zakatmaal/zakatperusahaan/zakat.page.dart';
import 'package:zakatax/home/menu/zakatmaal/zakatprofesi/harta.page.dart';
import 'package:zakatax/home/menu/zakatmaal/zakatprofesi/profesi.page.dart';

class ZakatMaalPage extends StatefulWidget {
  @override
  _ZakatMaalPageState createState() => _ZakatMaalPageState();
}

class _ZakatMaalPageState extends State<ZakatMaalPage> {
  double _menuProfesiChildHeight = 0.0;
  double _menuPeternakanChildHeight = 0.0;
  double _menuPertanianChildHeight = 0.0;
  double _menuEmasChildHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Maal'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Menu Zakat Maal',
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
                            'assets/ic_chest.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Zakat Profesi/Harta',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        Icon(
                          _menuProfesiChildHeight == 0
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (_menuProfesiChildHeight == 0)
                      _menuProfesiChildHeight = 172.0;
                    else
                      _menuProfesiChildHeight = 0.0;
                  });
                },
              ),
              Container(
                height: _menuProfesiChildHeight,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
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
                                'Harta Simpanan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ZakatHartaPage();
                        }));
                      },
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
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
                                'Profesi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ZakatProfesiPage();
                        }));
                      },
                    )
                  ],
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
                            'assets/ic_office.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        Text(
                          'Zakat Perusahaan',
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
                    return ZakatPerusahaanPage();
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
                            'assets/ic_barn.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Zakat Peternakan',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        Icon(
                          _menuPeternakanChildHeight == 0
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (_menuPeternakanChildHeight == 0)
                      _menuPeternakanChildHeight = 248.0;
                    else
                      _menuPeternakanChildHeight = 0.0;
                  });
                },
              ),
              Container(
                height: _menuPeternakanChildHeight,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_barn.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Unta',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_barn.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Sapi/Kerbau/Kuda',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_barn.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Domba',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
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
                            'assets/ic_farm.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Zakat Pertanian',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        Icon(
                          _menuPertanianChildHeight == 0
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (_menuPertanianChildHeight == 0)
                      _menuPertanianChildHeight = 172.0;
                    else
                      _menuPertanianChildHeight = 0.0;
                  });
                },
              ),
              Container(
                height: _menuPertanianChildHeight,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_farm.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Air Hujan/Sungai',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_farm.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Air Irigasi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
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
                            'assets/ic_gold.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Zakat Emas Perak',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                        Icon(
                          _menuEmasChildHeight == 0
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (_menuEmasChildHeight == 0)
                      _menuEmasChildHeight = 172.0;
                    else
                      _menuEmasChildHeight = 0.0;
                  });
                },
              ),
              Container(
                height: _menuEmasChildHeight,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_gold.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Emas',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      splashColor: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 2.0),
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          height: 72.0,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  'assets/ic_gold.png',
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              ),
                              Text(
                                'Perak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
