import 'package:flutter/material.dart';
import 'package:zakatax/util/appcolors.util.dart';

class InfoZakatPage extends StatefulWidget {
  @override
  _InfoZakatPageState createState() => _InfoZakatPageState();
}

class _InfoZakatPageState extends State<InfoZakatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Zakat'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '1. Tentang Zakat',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Zakat adalah sejumlah harta yang wajib dikeluarkan oleh pemeluk agama Islam untuk diberikan kepada '
                          'golongan yang berhak menerima, seperti fakir miskin dan semacamnya, sesuai dengan yang ditetapkan '
                          'oleh syariah.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  Text(
                    'Zakat termasuk ke dalam rukun Islam dan menjadi salah satu unsur yang paling penting dalam menegakkan '
                        'syariat Islam. Oleh karena itu hukum zakat adalah wajib bagi setiap muslim yang telah memenuhi '
                        'syarat-syarat tertentu. Zakat juga merupakan bentuk ibadah seperti sholat, puasa, dan lainnya dan '
                        'telah diatur dengan rinci berdasarkan Al-quran dan Sunah.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0, top: 32.0),
                    child: Text(
                      '2. Niat Zakat',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '- Niat Zakat Fitrah untuk Diri Sendiri',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Align(
                        child: Text(
                          'ﻧَﻮَﻳْﺖُ أَﻥْ أُﺧْﺮِﺝَ ﺯَﻛَﺎﺓَ ﺍﻟْﻔِﻄْﺮِ ﻋَﻦْ ﻧَﻔْسيْ ﻓَﺮْﺿًﺎ ِﻟﻠﻪِ ﺗَﻌَﺎﻟَﻰ',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.right,
                        ),
                        alignment: Alignment.centerRight),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'NAWAITU AN-UKHRIJA ZAKAATAL FITHRI ‘ANNAFSII FARDHON LILLAHI TA’AALAA',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Yang artinya : "Aku niat mengeluarkan zakat fitrah untuk diriku sendiri, fardu karena Allah Ta‘âlâ."',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '- Niat Zakat Fitrah untuk Istri',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Align(
                        child: Text(
                          'ﻧَﻮَﻳْﺖُ ﺃَﻥْ ﺃُﺧْﺮِﺝَ ﺯَﻛَﺎﺓَ ﺍﻟْﻔِﻄْﺮِﻋَﻦْ ﺯَﻭْﺟَﺘِﻲْ ﻓَﺮْﺿًﺎ ِﻟﻠﻪِ ﺗَﻌَﺎﻟَﻰ',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.right,
                        ),
                        alignment: Alignment.centerRight),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'NAWAITU AN-UKHRIJA ZAKAATAL FITHRI ‘AN ZAUJATII FARDHON LILLAHI TA’AALAA',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Yang artinya : "Aku niat mengeluarkan zakat fitrah untuk istriku, fardu karena Allah Ta‘âlâ."',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '- Niat Zakat Fitrah untuk Anak Laki-laki / Perempuan',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Align(
                        child: Text(
                          'نَوَيْتُ أَنْ أُخْرِجَ زَكَاةَ الْفِطْرِ عَنْ وَلَدِيْ… / بِنْتِيْ… فَرْضًا ِللهِ تَعَالَى',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                          textAlign: TextAlign.right,
                        ),
                        alignment: Alignment.centerRight),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'NAWAITU AN-UKHRIJA ZAKAATAL FITHRI ‘AN WALADII… / BINTII… FARDHON LILLAHI TA’AALAA',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Yang artinya : "Aku niat mengeluarkan zakat fitrah untuk anak laki-lakiku…. (sebutkan nama) / anak perempuanku…. (sebutkan nama), fardu karena Allah Ta‘âlâ."',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '- Niat Zakat Fitrah untuk Diri Sendiri dan Keluarga',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Align(
                        child: Text(
                          'ﻧَﻮَﻳْﺖُ ﺃَﻥْ ﺃُﺧْﺮِﺝَ ﺯَﻛَﺎﺓَ ﺍﻟْﻔِﻄْﺮِ ﻋَنِّيْ ﻭَﻋَﻦْ ﺟَﻤِﻴْﻊِ ﻣَﺎ ﻳَﻠْﺰَﻣُنِيْ ﻧَﻔَﻘَﺎﺗُﻬُﻢْ ﺷَﺮْﻋًﺎ ﻓَﺮْﺿًﺎ ِﻟﻠﻪِ ﺗَﻌَﺎﻟَﻰ',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        alignment: Alignment.centerRight),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'NAWAITU AN-UKHRIJA ZAKAATAL FITHRI ‘ANNI WA AN JAMI’I MA YALZIMUNIY NAFAQATUHUM SYAR’AN FARDHAN LILLAHI TA’ALA',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Yang artinya : "Aku niat mengeluarkan zakat fitrah untuk diriku dan seluruh orang yang nafkahnya menjadi tanggunganku, fardu karena Allah Ta‘âlâ."',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '- Niat Zakat Fitrah untuk Orang yang Diwakilkan',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Align(
                        child: Text(
                          'ﻧَﻮَﻳْﺖُ ﺃَﻥْ ﺃُﺧْﺮِﺝَ ﺯَﻛَﺎﺓَ ﺍﻟْﻔِﻄْﺮِ ﻋَﻦْ (..…) ﻓَﺮْﺿًﺎ ِﻟﻠﻪِ ﺗَﻌَﺎﻟَﻰ',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        alignment: Alignment.centerRight),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'NAWAITU AN UKHRIJA ZAKAATAL FITHRI ‘AN (……) FARDHAN LILLAHI TA’ALA',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        'Yang artinya : "Aku niat mengeluarkan zakat fitrah untuk… (sebutkan nama), fardu karena Allah Ta‘âlâ."',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '3. Dalil Zakat',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      'Di dalam Al-quran banyak sekali ayat yang menyebutkan tentang wajibnya keutmaan dan wajibnya zakat. Seperti berikut ini:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '“Jika mereka bertaubat, mendirikan sholat dan menunaikan zakat, maka (mereka itu) adalah saudara-saudaramu seagama. '
                          'Dan Kami menjelaskan ayat-ayat itu bagi kaum yang mengetahui“ (QS. At-Taubah : 11)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '“Ambillah zakat dari sebagian harta mereka, dengan zakat itu kamu membersihkan dan mensucikan mereka dan mendoalah untuk mereka“. (QS. At-Taubah :103)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '“Dan apa yang kamu berikan berupa zakat yang kamu maksudkan untuk mencapai keridhaan Allah, maka (yang berbuat demikian) '
                          'itulah orang-orang yang melipat gandakan (pahalanya)“. (QS. Ar-Rum :39)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '“Zakat Fitri merupakan pembersih bagi yang berpuasa dari hal-hal yang tidak bermanfaat dan kata-kata keji (yang dikerjakan waktu puasa), '
                          'dan bantuan makanan untuk para fakir miskin”.(HR. Abu Daud)',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '“Barang siapa yang membayar zakat fitrah sebelum shalat ied, maka termasuk zakat fitrah yang diterima, dan barang siapa yang membayarnya '
                          'sesudah shalat ied maka termasuk sedekah biasa (bukan lagi dianggap zakat fitrah)“. (HR. Bukhari dan Muslim)”',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
