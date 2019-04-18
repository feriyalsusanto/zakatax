import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';

class ZakatProfesiPage extends StatefulWidget {
  @override
  _ZakatProfesiPageState createState() => _ZakatProfesiPageState();
}

class _ZakatProfesiPageState extends State<ZakatProfesiPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _cashController = new TextEditingController();
  TextEditingController _otherController = new TextEditingController();
  TextEditingController _hutangController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profesi'),
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
                      'Zakat Profesi adalah zakat yang dikeluarkan dari penghasilan profesi (hasil profesi) bila telah mencapai nisab. Profesi tersebut misalnya pegawai negeri atau swasta, konsultan, dokter, notaris, akuntan, artis, dan wiraswasta.'),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Profesi',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Pendapatan Per Bulan'),
                    keyboardType: TextInputType.number,
                    controller: _cashController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Pendapatan Tambahan Per Bulan'),
                    keyboardType: TextInputType.number,
                    controller: _otherController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Hutang atau Cicilan Per Bulan'),
                    keyboardType: TextInputType.number,
                    controller: _hutangController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
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
                        labelText:
                            'Total Zakat Profesi yang Harus Dikeluarkan'),
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

      int cash = int.parse(_cashController.text);
      int other = int.parse(_otherController.text);
      int hutang = int.parse(_hutangController.text);

      int total = ((cash + other - hutang) * 0.025).round();

      _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(total)}';
    }
  }
}
