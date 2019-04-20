import 'package:flutter/material.dart';
import 'package:zakatax/home/history/detail.page.dart';
import 'package:zakatax/util/NumberFormatUtil.dart';
import 'package:zakatax/util/database.util.dart';

class HistoryListPage extends StatelessWidget {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<Map<String, dynamic>> list =
              snapshot.hasData ? snapshot.data : [];
          if (list.length > 0) {
            return ListView.separated(
                itemBuilder: (context, i) {
                  Map<String, dynamic> data = list[i];
                  print('data ${data.toString()}');
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HistoryDetailPage(data);
                      }));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(data['name']),
                        Text(
                          data['date'] == null ? '-' : data['date'],
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        )
                      ],
                    ),
                    subtitle: Text(
                      'Jumlah Zakat: Rp ${NumberFormatUtil.currencyFormat(int.parse(data['total']))}',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  );
                },
                separatorBuilder: (context, i) => Divider(
                      color: Colors.grey,
                      height: 1.0,
                    ),
                itemCount: list.length);
          } else {
            return Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    size: 42.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'History Zakat Kosong',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            );
          }
        }
      },
      future: _getHistory(),
    );
  }

  _getHistory() async {
    List<Map<String, dynamic>> list = await dbHelper.queryAllRows();
    print('rows: ${list.length}');
    return list;
  }
}
