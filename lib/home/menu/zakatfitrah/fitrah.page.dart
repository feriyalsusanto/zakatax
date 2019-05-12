import 'package:flutter/material.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

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
      backgroundColor: AppColors.primaryColors,
      appBar: AppBar(
        title: Text('Zakat Fitrah'),
        elevation: 0.0,
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
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                  key: _formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                          'Zakat fitrah adalah salah satu kewajiban sebagai seorang muslim baik itu laki-laki maupun perempuan. Oleh karena itu, Allah SWT '
                          'telah memerintahkan kita untuk selalu menunaikan zakat fitrah sesuai dengan waktunya.',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Perhitungan Zakat Fitrah',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                      AppTextFormField(
                        label: 'Harga Beras /Kg',
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        validator: (val) =>
                            val.isEmpty ? 'Harga Beras harus diisi' : null,
                      ),
                      AppTextFormField(
                        label: 'Zakat Fitrah (2.5 Kg)',
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                      AppTextFormField(
                        label: 'Jumlah Orang',
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
                      AppTextFormField(
                        label: 'Total Zakat Fitrah yang Harus Dikeluarkan',
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
      //harga beras
      int price = int.parse(_priceController.text);
      //wajib zakat perorang
      double rice = 2.5;
      //total orang
      int amount = int.parse(_amountController.text);

      //itung zakat berdasarkan (harga beras x 2.5kg) x jumlah orang
      int totalPrice = ((price * rice) * amount).round();
      //itung zakat berdasarkan beras * jumlah orang
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
