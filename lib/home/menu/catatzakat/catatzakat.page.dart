import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:zakatax/util/appcolors.util.dart';
import 'package:zakatax/util/database.util.dart';
import 'package:zakatax/util/dateformat.util.dart';
import 'package:zakatax/util/loader.util.dart';
import 'package:zakatax/util/path.util.dart';
import 'package:zakatax/util/textformfield.style.dart';

class CatatZakatPage extends StatefulWidget {
  @override
  _CatatZakatPageState createState() => _CatatZakatPageState();
}

class _CatatZakatPageState extends State<CatatZakatPage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  TextEditingController _totalController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();

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
        title: Text('Catatan Zakat Pribadi'),
        actions: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.check),
            ),
            onTap: () {
              _processZakat(context);
            },
          )
        ],
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
                        'Silahkan isi dengan lengkap form dibawah untuk pencatatan transaksi zakat yang anda lakukan.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      ),
                      AppTextFormField(
                        label: 'Nama Yayasan Penerima Zakat',
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                      ),
                      AppTextFormField(
                        label: 'Jumlah Zakat',
                        keyboardType: TextInputType.number,
                        controller: _totalController,
                        validator: (val) =>
                        val.isEmpty ? 'Field ini harus diisi' : null,
                      ),
                      DateTimePickerFormField(
                        controller: _dateController,
                        inputType: InputType.date,
                        format: _formats[0],
                        editable: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: 'Tanggal',
                            hasFloatingPlaceholder: true,
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        onChanged: (dt) => setState(() {
                          _date = dt;
                          _dateController.text =
                              DateFormatUtil.parseDateTimeLocal(_date);
                        }),
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
                        child: _generatePreview(),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }

  _generatePreview() {
    if (_image == null) {
      return Text(
        'PREVIEW FOTO',
        style: TextStyle(
            color: Colors.blue, fontSize: 12.0, fontWeight: FontWeight.w600),
      );
    } else {
      return Image.file(
        _image,
        height: 240.0,
        fit: BoxFit.cover,
      );
    }
  }

  Future _getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _processZakat(BuildContext context) async {
    final FormState formState = _formState.currentState;
    if (!formState.validate()) {
    } else {
      formState.save();

      dialogLoader(context);

      String filePath = await DirectoryPathUtil.getDirectoryPath();
      File file = await _image.copy(filePath + '/' + basename(_image.path));
      if (await file.exists()) {
        print(file.path);
        _insertData(context, file.path);
      } else {
        _scaffoldState.currentState.showSnackBar(
            SnackBar(content: Text('Gagal menambahkan catatan zakat')));
      }
    }
  }

  _insertData(BuildContext context, String path) async {
    try {
      Map<String, dynamic> row = {
        DatabaseHelper.columnName: _nameController.text,
        DatabaseHelper.columnTotal: _totalController.text,
        DatabaseHelper.columnDate: _dateController.text,
        DatabaseHelper.columnImage: path
      };

      final id = await dbHelper.insert(row);
      print('inserted id $id');
      Navigator.pop(context);
      if (id > 0) {
        _scaffoldState.currentState.showSnackBar(
            SnackBar(content: Text('Berhasil menambahkan catatan zakat')));
        Navigator.pop(context);
      } else {
        _scaffoldState.currentState.showSnackBar(
            SnackBar(content: Text('Gagal menambahkan catatan zakat')));
      }
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }
}
