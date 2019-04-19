import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zakatax/util/database.util.dart';

class CatatZakatPage extends StatefulWidget {
  @override
  _CatatZakatPageState createState() => _CatatZakatPageState();
}

class _CatatZakatPageState extends State<CatatZakatPage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _totalController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  final dbHelper = DatabaseHelper.instance;
  final _formats = {InputType.date: DateFormat("yyyy-MM-dd")};
  DateTime _date;

  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('Catat Bukti Zakat'),
        actions: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.check),
            ),
            onTap: _processZakat,
          )
        ],
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
                    'Silahkan isi dengan lengkap form dibawah untuk pencatatan transaksi zakat yang anda lakukan.',
                    textAlign: TextAlign.justify,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nama Yayasan Penerima Zakat'),
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Jumlah Zakat'),
                    keyboardType: TextInputType.number,
                    controller: _totalController,
                    validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                  ),
                  DateTimePickerFormField(
                    inputType: InputType.date,
                    format: _formats[0],
                    editable: true,
                    decoration: InputDecoration(
                        labelText: 'Tanggal', hasFloatingPlaceholder: false),
                    onChanged: (dt) => setState(() => _date = dt),
                    validator: (date) =>
                        date == null ? 'Field ini harus diisi' : null,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _getImage();
                      },
                      child: Text(
                        'UPLOAD BUKTI ZAKAT (OPSIONAL)',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    height: 240.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(4.0))),
                    alignment: Alignment.center,
                    child: Text(
                      'PREVIEW FOTO',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Future _getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _processZakat() {
    final FormState formState = _formState.currentState;
    if (!formState.validate()) {
    } else {
      formState.save();
//      _insertData();
    }
  }

  _insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: _nameController.text,
      DatabaseHelper.columnTotal: _totalController.text,
      DatabaseHelper.columnDate: _date.toIso8601String(),
      DatabaseHelper.columnImage: ''
    };

    final id = await dbHelper.insert(row);
    print('inserted id $id');
    if (id > 0) {
      _scaffoldState.currentState.showSnackBar(
          SnackBar(content: Text('Berhasil menambahkan catatan zakat')));
      Navigator.pop(context);
    } else {
      _scaffoldState.currentState.showSnackBar(
          SnackBar(content: Text('Gagal menambahkan catatan zakat')));
    }
  }
}
