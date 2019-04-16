import 'package:flutter/material.dart';

class ZakatUntaPage extends StatefulWidget {
  @override
  _ZakatUntaPageState createState() => _ZakatUntaPageState();
}

class _ZakatUntaPageState extends State<ZakatUntaPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _ekorController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ternak Unta'),
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
                      'Seseorang bila memiliki binatang ternak, baik unta, sapi, atau kambing, mempunyai kemungkinan untuk kena wajib zakat. '
                      'Kewajiban tersebut jatuh salah satunya bila jumlahnya telah mencapai nishab atau batas minumum wajib zakat. '
                      'Berikut adalah daftar nishab masing-masing binatang ternak dengan detail jumlah zakat dan umur binatang ternak yang mesti dikeluarkan.'),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Perhitungan Zakat Ternak Unta',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    ),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Jumlah Hewan Ternak Unta'),
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
                    'Total Zakat Ternak Unta yang Harus Dikeluarkan',
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

      int minim = 5;
      int ekor = int.parse(_ekorController.text);

      if (ekor >= minim) {
        if (ekor >= 5 && ekor < 10) {
          _totalController.text =
              '1 ekor kambing umur 2 tahun, \natau 1 ekor domba umur 1 tahun';
        } else if (ekor >= 10 && ekor < 15) {
          _totalController.text =
              '2 ekor kambing umur 2 tahun, \natau 2 ekor domba umur 1 tahun';
        } else if (ekor >= 15 && ekor < 20) {
          _totalController.text =
              '3 ekor kambing umur 2 tahun, \natau 3 ekor domba umur 1 tahun';
        } else if (ekor >= 20 && ekor < 25) {
          _totalController.text =
              '4 ekor kambing umur 2 tahun, \natau 4 ekor domba umur 1 tahun';
        } else if (ekor >= 25 && ekor < 36) {
          _totalController.text = '1 ekor onta betina umur 1 tahun';
        } else if (ekor >= 36 && ekor < 46) {
          _totalController.text = '1 ekor onta betina umur 2 tahun';
        } else if (ekor >= 46 && ekor < 61) {
          _totalController.text = '1 ekor onta betina umur 3 tahun';
        } else if (ekor >= 61 && ekor < 76) {
          _totalController.text = '1 ekor onta betina umur 4 tahun';
        } else if (ekor >= 76 && ekor < 91) {
          _totalController.text = '2 ekor onta betina umur 2 tahun';
        } else if (ekor >= 91 && ekor < 121) {
          _totalController.text = '2 ekor onta betina umur 3 tahun';
        } else if (ekor >= 121 && ekor < 140) {
          _totalController.text = '3 ekor onta betina umur 2 tahun';
        } else if (ekor >= 140) {
          int betina2Tahun = 0;
          int betina3Tahun = 0;

          while (true) {
            if (ekor == 0) break;

            if (ekor % 50 == 0) {
              betina3Tahun += (ekor / 50).round();
              ekor = 0;
            } else if (ekor % 40 == 0) {
              betina2Tahun += (ekor / 40).round();
              ekor = 0;
            } else if (ekor - 50 >= 0) {
              ekor -= 50;
              betina3Tahun++;
              if (ekor - 40 >= 0) {
                ekor -= 40;
                betina2Tahun++;
              }
            } else {
              break;
            }
          }

          String total =
              '$betina3Tahun ekor unta betina umur 3 tahun \ndan $betina2Tahun ekor unta betina umur 2 tahun';
          _totalController.text = total;
        }
      } else {
        _totalController.text = 'Anda tidak wajib melakukan zakat';
      }
      setState(() {});
    }
  }
}
