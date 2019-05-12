import 'package:flutter/material.dart';
import 'package:zakatax/util/appcolors.util.dart';

class ListLembagaPage extends StatefulWidget {
  @override
  _ListLembagaPageState createState() {
    return _ListLembagaPageState();
  }
}

class _ListLembagaPageState extends State<ListLembagaPage> {
  List<LembagaModel> _list = [
    LembagaModel(
        title: 'Dompet Dhuafa Republika',
        address:
            'Jl. Warung Jati Barat No.14, Jakarta Selatan 12540, Indonesia',
        contact: Contact(phone: '+62 21 7821292', fax: '+62 21 7821333')),
    LembagaModel(
        title: 'NU Care-LazisNU',
        address:
            'Gedung PBNU, Lt. 2, Jl. Kramat Raya, No. 164, Jakarta Pusat (10430)',
        contact: Contact(phone: '0813 9800 9800', fax: '-')),
    LembagaModel(
        title: 'Baznas',
        address:
            'Jl. Kb. Sirih Raya No.57, RT.08 RW.02, Kebon Sirih, Jakarta Pusat, 10340',
        contact: Contact(phone: '+6221 3904555', fax: '+6221 3913777')),
    LembagaModel(
        title: 'Aksi Cepat Tanggap',
        address:
            'Menara 165, lantai 11, Jl. TB. Simatupang Kav. 1, Cilandak Timur Jakarta Selatan, 12560, Indonesia',
        contact: Contact(phone: '+62 21 2940 6565', fax: '+62 21 2940 6564')),
    LembagaModel(
        title: 'Rumah Yatim',
        address: 'Jln. Terusan Jakarta No. 212, Antapani - Bandung',
        contact: Contact(phone: '(022) 7217014', fax: '-')),
    LembagaModel(
        title: 'Lazismu',
        address:
            'Jalan Menteng Raya 62, RT.3/RW.9, Kb. Sirih, Menteng, Jakarta Pusat, Indonesia',
        contact: Contact(phone: '+6221 3150400', fax: '-')),
    LembagaModel(
        title: 'Baitul Maal Hidayatullah',
        address:
            'Jl. H. Samali No. 79B Pejaten Barat, Pasar Minggu, Jakarta Selatan – 12510',
        contact: Contact(phone: '021-791 96500', fax: '-'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Lembaga Zakat'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/ic_logo.png',
              color: AppColors.primaryLightColor,
            ),
          ),
          ListView.separated(
            itemCount: _list.length,
            itemBuilder: (context, position) {
              LembagaModel lembaga = _list[position];
              return ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(
                  lembaga.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      lembaga.address,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Telp.: ${lembaga.contact.phone}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Fax: ${lembaga.contact.fax}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, position) {
              return Divider(
                height: 1.0,
                color: Colors.white,
              );
            },
          )
        ],
      ),
    );
  }
}

class LembagaModel {
  String title;
  String address;
  Contact contact;

  LembagaModel({this.title, this.address, this.contact});
}

class Contact {
  String phone;
  String fax;

  Contact({this.phone, this.fax});
}
