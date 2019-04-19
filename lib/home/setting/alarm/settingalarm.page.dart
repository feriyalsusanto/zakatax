import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import '../../home.page.dart';

class SettingAlarmPage extends StatefulWidget {
  @override
  _SettingAlarmPageState createState() => _SettingAlarmPageState();
}

class _SettingAlarmPageState extends State<SettingAlarmPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> dates = ['Pilih Tanggal'];

  final formats = {
    InputType.time: DateFormat("HH:mm"),
  };

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    for (int x = 1; x < 32; x++) {
      dates.add('$x');
    }
  }

  String _selectedDate = 'Pilih Tanggal';
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pengaturan Alarm'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Pengaturan Alarm berfungsi untuk mengatur jadwal bulanan sesuai pengaturan untuk pengingat pembayaran Zakat rutin.',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  'Tanggal Tiap Bulan',
                  style: TextStyle(color: Colors.grey),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDate,
                    items: dates.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {
                      setState(() {
                        _selectedDate = _;
                      });
                    },
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Pukul',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                DateTimePickerFormField(
                  inputType: InputType.time,
                  format: formats[0],
                  editable: true,
                  decoration: InputDecoration(
                      labelText:
                          date != null ? _parseTime(date) : 'Pilih Waktu',
                      labelStyle: TextStyle(color: Colors.black),
                      hasFloatingPlaceholder: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero),
                  onChanged: (dt) => setState(() => date = dt),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ],
            )),
            RaisedButton(
              onPressed: _showAlertDialog,
              child: Text(
                'ATUR ALARM',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  _showAlertDialog() {
    if (_selectedDate == 'Pilih tanggal' || date == null) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content:
              Text('Silahkan lengkapi tanggal dan waktu terlebih dahulu')));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Konfirmasi Alarm'),
              content: Text(
                  'Apakah anda yakin mengatur alarm untuk setiap tanggal $_selectedDate dan pukul ${_parseTime(date)} tiap bulan?'),
              actions: <Widget>[
                FlatButton(
                  child: new Text("Batal"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: new Text("Setuju"),
                  onPressed: () {
                    _setAlarm();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  _setAlarm() async {
    var scheduledNotificationDateTime =
    new DateTime.now().add(new Duration(seconds: 5));
    var androidPlatformChannelSpecifics =
    new AndroidNotificationDetails('your other channel id',
        'your other channel name', 'your other channel description');
    var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        90,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);

    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text('Berhasil mengatur alarm')));
  }

  _parseTime(DateTime time) {
    String hour = '${time.hour}';
    if (time.hour < 10) {
      hour = '0${time.hour}';
    }

    String minute = '${time.minute}';
    if (time.minute < 10) {
      minute = '0${time.minute}';
    }

    return '$hour:$minute';
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new HomePage()),
    );
  }
}
