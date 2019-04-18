import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';

class ZakatPerakPage extends StatefulWidget {

  @override
  _ZakatPerakPageState createState() => _ZakatPerakPageState();
}

class _ZakatPerakPageState extends State<ZakatPerakPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _priceController = new TextEditingController();
  TextEditingController _goldController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Perak'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Nisab Zakat Perak :',
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      'Minimal jumlah perak yang harus dikeluarkan zakatnya adalah 595 gram perak. Zakatnya 2.5% dari total perak yang anda punya.'),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Perak',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: 'Harga Perak Saat Ini'),
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    validator: (val) =>
                    val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Perak yang Dimiliki (gram)'),
                    keyboardType: TextInputType.number,
                    controller: _goldController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: RaisedButton(
                      onPressed: _sumZakat,
                      color: Colors.blue,
                      child: Text(
                        'HITUNG ZAKAT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    'Total Zakat Perak yang Harus Dikeluarkan',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
                    child: Text(
                      _totalController.text,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.grey,
                  )
                ],
              )),
        ),
      ),
    );
  }

  _sumZakat() {
    final FormState formState = _formState.currentState;
    if (!formState.validate()) {
    } else {
      formState.save();

      int price = int.parse(_priceController.text);
      int nisab = price * 595;
      double income = double.parse(_goldController.text) * price;

      if (income <= nisab) {
        _totalController.text = 'Anda tidak wajib mengeluarkan zakat';
      } else {
        int zakat = ((income * 0.025) + 0.4).round();
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(zakat)}';
      }

      setState(() {});
    }
  }
}