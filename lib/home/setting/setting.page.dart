import 'package:flutter/material.dart';

import 'alarm/settingalarm.page.dart';

class SettingPage extends StatelessWidget {
  final int TYPE_HEADER = 1;
  final int TYPE_MENU = 0;
  final int TYPE_DIVIDER = -1;

  List<ListData> _settings;

  SettingPage() {
    _settings = [
      ListData(null, 'Pengigat', TYPE_HEADER),
      ListData(Icons.alarm, 'Atur Pengingat Zakat', TYPE_MENU),
      ListData(null, 'divider', TYPE_DIVIDER),
      ListData(null, 'Lain-Lain', TYPE_HEADER),
      ListData(Icons.info, 'Tentang Aplikasi', TYPE_MENU),
      ListData(Icons.info, 'Tentang Kami', TYPE_MENU)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_settings.length, (position) {
            ListData data = _settings[position];
            if (data.type == TYPE_HEADER) {
              return _generateHeader(data.title);
            } else if (data.type == TYPE_MENU) {
              return _generateMenu(context, data.icon, data.title);
            } else {
              return _generateDivider();
            }
          }),
        ),
      ),
    );
  }

  _generateHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }

  _generateMenu(BuildContext context, IconData icon, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            if (title.toLowerCase().contains('pengingat')) {

            }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return SettingAlarmPage();
            }));
          },
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        )
      ],
    );
  }

  _generateDivider() {
    return Container(
      height: 32.0,
    );
  }
}

class ListData {
  String title;
  int type;
  IconData icon;

  ListData(IconData icon, String title, int type) {
    this.icon = icon;
    this.title = title;
    this.type = type;
  }
}
