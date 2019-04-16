import 'package:flutter/material.dart';
import 'package:zakatax/home/util/NumberFormatUtil.dart';

class ZakatFitrahPage extends StatefulWidget {
  @override
  _ZakatFitrahPageState createState() => _ZakatFitrahPageState();
}

class _ZakatFitrahPageState extends State<ZakatFitrahPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _priceController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Zakat Fitrah'),
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
                      'Zakat fitrah adalah salah satu kewajiban sebagai seorang muslim baik itu laki-laki maupun perempuan. Oleh karena itu, Allah SWT '
                      'telah memerintahkan kita untuk selalu menunaikan zakat fitrah sesuai dengan waktunya.'),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Fitrah',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Harga Beras /Kg'),
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    validator: (val) =>
                        val.isEmpty ? 'Harga Beras harus diisi' : null,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Zakat Fitrah (2.5 Kg)'),
                    keyboardType: TextInputType.number,
                    enabled: false,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Jumlah Orang'),
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    validator: (val) =>
                        val.isEmpty ? 'Jumlah Orang harus diisi' : null,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: _sumZakat,
                      color: Colors.blue,
                      child: Text(
                        'HITUNG ZAKAT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Total Zakat Fitrah yang Harus Dikeluarkan'),
                    keyboardType: TextInputType.number,
                    enabled: false,
                    controller: _totalController,
                  ),
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
      double rice = 2.5;
      int amount = int.parse(_amountController.text);

      int totalPrice = ((price * rice) * amount).round();
      double totalRice = amount * rice;

      _totalController.text =
          'Rp ${NumberFormatUtil.currencyFormat(totalPrice)} atau $totalRice Kg Beras';
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}
