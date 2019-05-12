import 'package:flutter/material.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

class ZakatDombaPage extends StatefulWidget {
  @override
  _ZakatDombaPageState createState() => _ZakatDombaPageState();
}

class _ZakatDombaPageState extends State<ZakatDombaPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _ekorController = new TextEditingController();
  String totalZakat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ternak Kambing/Domba'),
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
                        'Seseorang bila memiliki binatang ternak, baik unta, sapi, atau kambing, mempunyai kemungkinan untuk kena wajib zakat. '
                            'Kewajiban tersebut jatuh salah satunya bila jumlahnya telah mencapai nishab atau batas minumum wajib zakat. '
                            'Berikut adalah daftar nishab masing-masing binatang ternak dengan detail jumlah zakat dan umur binatang ternak yang mesti dikeluarkan.',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Perhitungan Zakat Ternak Kambing/Domba',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                      AppTextFormField(
                        label: 'Jumlah Hewan Ternak',
                        keyboardType: TextInputType.number,
                        controller: _ekorController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
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
                        'Total Zakat Ternak Kambing/Domba yang Harus Dikeluarkan',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, top: 4.0),
                        child: Text(
                          totalZakat,
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

      //nishab untuk zakat
      int minim = 40;

      int ekor = int.parse(_ekorController.text);

      if (ekor >= minim) {
        if (ekor >= 40 && ekor < 121) {
          totalZakat =
              '1 ekor kambing umur 2 tahun, \natau 1 ekor domba umur 1 tahun';
        } else if (ekor >= 121 && ekor < 201) {
          totalZakat =
              '2 ekor kambing umur 2 tahun, \natau 2 ekor domba umur 1 tahun';
        } else if (ekor >= 201 && ekor < 400) {
          totalZakat =
              '3 ekor kambing umur 2 tahun, \natau 3 ekor domba umur 1 tahun';
        } else if (ekor >= 400 && ekor < 500) {
          totalZakat =
              '4 ekor kambing umur 2 tahun, \natau 4 ekor domba umur 1 tahun.';
        } else if (ekor >= 500) {
          int zakat = ekor ~/ 100;
          totalZakat =
              '$zakat ekor kambing umur 2 tahun, \natau $zakat ekor domba umur 1 tahun';
        }
      } else {
        totalZakat = 'Anda tidak wajib melakukan zakat';
      }
      setState(() {});
    }
  }
}
