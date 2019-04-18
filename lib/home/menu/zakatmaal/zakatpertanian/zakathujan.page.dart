import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';

class ZakatHujanSungaiPage extends StatefulWidget {
  @override
  _ZakatHujanSungaiPageState createState() => _ZakatHujanSungaiPageState();
}

class _ZakatHujanSungaiPageState extends State<ZakatHujanSungaiPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _incomeController = new TextEditingController();
  TextEditingController _productionController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Pertanian'),
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
                    'Nisab Zakat Pertanian :',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      'Minimal jumlah hasil tani yang harus dikeluarkan zakatnya adalah 653 kilogram. Zakatnya 10% dari total hasil tani yang anda punya.'),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Pertanian Air Hujan/Sungai',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Pendapatan Hasil Panen'),
                    keyboardType: TextInputType.number,
                    controller: _incomeController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Biaya Produksi'),
                    keyboardType: TextInputType.number,
                    controller: _productionController,
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
                    'Total Zakat Pertanian yang Harus Dikeluarkan',
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

      int nisab = 7183000;
      int income = int.parse(_incomeController.text);
      int production = _productionController.text.isEmpty
          ? 0
          : int.parse(_productionController.text);

      if (income <= nisab) {
        _totalController.text = 'Anda tidak wajib mengeluarkan zakat';
      } else {
        int zakat = ((income - production) * 0.10).round();
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(zakat)}';
      }

      setState(() {});
    }
  }
}
