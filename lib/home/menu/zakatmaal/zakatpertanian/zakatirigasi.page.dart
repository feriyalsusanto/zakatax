import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

class ZakatIrigasiPage extends StatefulWidget {
  @override
  _ZakatIrigasiPageState createState() => _ZakatIrigasiPageState();
}

class _ZakatIrigasiPageState extends State<ZakatIrigasiPage> {
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
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/ic_logo.png',
              color: AppColors.primaryLightColor,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                  key: _formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Nisab Zakat Pertanian :',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        'Minimal jumlah hasil tani yang harus dikeluarkan zakatnya adalah 653 kilogram. Zakatnya 10% dari total hasil tani yang anda punya.',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Perhitungan Zakat Pertanian Air Irigasi',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                      AppTextFormField(
                        label: 'Pendapatan Hasil Panen',
                        keyboardType: TextInputType.number,
                        controller: _incomeController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                      ),
                      AppTextFormField(
                        label: 'Biaya Produksi',
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
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
                        child: Text(
                          _totalController.text,
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          )
        ],
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
        int zakat = ((income - production) * 0.05).round();
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(zakat)}';
      }

      setState(() {});
    }
  }
}
