import 'package:flutter/material.dart';
import 'package:zakatax/home/menu/menu.page.dart';
import 'package:zakatax/home/setting/setting.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key;

  final drawerItems = [
    DrawerItem("Menu Zakat", Icons.book),
    DrawerItem("Pengaturan", Icons.settings)
  ];

  String _title = 'Zakatax';
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MenuPage();
      case 1:
        return SettingPage();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    Navigator.of(context).pop();
    setState(() {
      _selectedDrawerIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          break;
        case 1:
          _title = 'Pengaturan';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();

    _title = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[
      DrawerHeader(
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Selamat Datang di Aplikasi Zakatax",
            style: TextStyle(color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      )
    ];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerOptions,
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
