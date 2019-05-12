import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

class ZakatPerusahaanPage extends StatefulWidget {
  @override
  _ZakatPerusahaanPageState createState() => _ZakatPerusahaanPageState();
}

class _ZakatPerusahaanPageState extends State<ZakatPerusahaanPage> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _goldController = new TextEditingController();
  TextEditingController _cashController = new TextEditingController();
  TextEditingController _hutangController = new TextEditingController();
  TextEditingController _totalController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Perusahaan'),
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
                        'Zakat Perusahaan adalah zakat yang dikenakan atas perusahaan yang menjalankan usahanya (dapat bertindak secara hukum, '
                            'memiliki hak dan kewajiban, serta dapat memiliki kekayaan sendiri).', style: TextStyle(color: Colors.white),),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Perhitungan Zakat Perusahaan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                      AppTextFormField(
                        label: 'Harga Emas Saat Ini /Gram',
                        keyboardType: TextInputType.number,
                        controller: _goldController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                      ),
                      AppTextFormField(
                        label: 'Aset Perusahaan',
                        keyboardType: TextInputType.number,
                        controller: _cashController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                      ),
                      AppTextFormField(
                        label: 'Hutang Jangka Pendek',
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
                      AppTextFormField(
                        label: 'Total Zakat Perusahaan yang Harus Dikeluarkan',
                        keyboardType: TextInputType.number,
                        enabled: false,
                        controller: _totalController,
                      ),
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

      int gold = int.parse(_goldController.text) * 85;
      int total =
          (int.parse(_cashController.text) - int.parse(_hutangController.text));

      if (total <= 0 || total < gold) {
        _totalController.text = 'Perusahaan anda tidak wajib membayar pajak';
      } else {
        int zakat = (0.025 * total).round();
        _totalController.text = 'Rp ${NumberFormatUtil.currencyFormat(zakat)}';
      }
    }
  }
}
