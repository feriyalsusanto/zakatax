import 'package:flutter/material.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

class ZakatSapiPage extends StatefulWidget {
  @override
  _ZakatSapiPageState createState() => _ZakatSapiPageState();
}

class _ZakatSapiPageState extends State<ZakatSapiPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _ekorController = new TextEditingController();
  String totalZakat = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ternak Sapi/Kerbau/Kuda'),
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
                          'Perhitungan Zakat Ternak Sapi/Kerbau/Kuda',
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
                        'Total Zakat Ternak Sapi yang Harus Dikeluarkan',
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

      int minim = 30;
      int ekor = int.parse(_ekorController.text);

      int ekor1Tahun = 0;
      int ekor2Tahun = 0;

      if (ekor >= minim) {
        if (ekor >= 30 && ekor < 40) {
          totalZakat = '1 ekor sapi umur 1 tahun';
        } else if (ekor >= 40 && ekor < 60) {
          totalZakat = '1 ekor sapi umur 2 tahun';
        } else if (ekor >= 60) {
          while (true) {
            if (ekor == 0) break;

            if (ekor % 30 == 0) {
              ekor1Tahun += (ekor / 30).round();
              ekor = 0;
            } else if (ekor - 30 >= 0) {
              ekor -= 30;
              ekor1Tahun++;
              if (ekor - 40 >= 0) {
                ekor -= 40;
                ekor2Tahun++;
              }
            } else {
              break;
            }
          }

          totalZakat =
              '$ekor1Tahun ekor sapi umur 1 tahun \ndan $ekor2Tahun ekor sapi umur 2 tahun';
        }
      } else {
        totalZakat = 'Anda tidak wajib melakukan zakat';
      }
      setState(() {});
    }
  }
}
