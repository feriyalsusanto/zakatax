import 'package:flutter/material.dart';
import 'package:zakatax/home/util/NumberFormatUtil.dart';

class ZakatHartaPage extends StatefulWidget {
  @override
  _ZakatHartaPageState createState() => _ZakatHartaPageState();
}

class _ZakatHartaPageState extends State<ZakatHartaPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _goldController = new TextEditingController();
  TextEditingController _moneyController = new TextEditingController();
  TextEditingController _sahamController = new TextEditingController();
  TextEditingController _realController = new TextEditingController();
  TextEditingController _diamondController = new TextEditingController();
  TextEditingController _vehicleController = new TextEditingController();
  TextEditingController _hutangController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harta Simpanan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Nisab Zakat Harta Simpanan :',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Minimal jumlah Harta Simpanan yang harus dikeluarkan zakatnya adalah setara dengan 85 gram emas murni. '
                        'Zakatnya 2.5% dari total Harga Simpanan yang anda punya.',
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Harta Simpanan',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Harga Emas Murni Saat Ini /Gram'),
                    keyboardType: TextInputType.number,
                    controller: _goldController,
                    validator: (val) =>
                        val.isEmpty ? 'Harga Emas harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText:
                            'Uang Tunai, Tabungan, Deposito atau sejenisnya'),
                    keyboardType: TextInputType.number,
                    controller: _moneyController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Saham atau surat-surat berharga lainnya'),
                    keyboardType: TextInputType.number,
                    controller: _sahamController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText:
                            'Real Estate (tidak termasuk rumah tinggal yang dipakai sekarang)'),
                    keyboardType: TextInputType.number,
                    controller: _realController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Emas, Perak, Permata atau sejenisnya'),
                    keyboardType: TextInputType.number,
                    controller: _diamondController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText:
                            'Mobil (lebih dari keperluan anggota keluarga)'),
                    keyboardType: TextInputType.number,
                    controller: _vehicleController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText:
                            'Hutang Pribadi yg jatuh tempo dalam tahun ini'),
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
                            'Total Zakat Simpanan yang Harus Dikeluarkan'),
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

      int hargaEmas = int.parse(_goldController.text) * 85;
      int uang = int.parse(_moneyController.text);
      int saham = int.parse(_sahamController.text);
      int real = int.parse(_realController.text);
      int diamond = int.parse(_diamondController.text);
      int mobil = int.parse(_vehicleController.text);
      int hutang = int.parse(_hutangController.text);

      int total = uang + saham + real + diamond + mobil - hutang;
      if (total < hargaEmas) {
        _totalController.text = 'Anda tidak wajib membayar Zakat';
      } else {
        double zakat = total * 0.025;
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(zakat.round())}';
      }
    }
  }
}
