import 'package:flutter/material.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

void main() {
  runApp(AplikasiBermanfaat());
}

class AplikasiBermanfaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manfaat',
      home: ScreenAwal(),
    );
  }
}

class ScreenAwal extends StatefulWidget {
  @override
  _ScreenAwalState createState() => _ScreenAwalState();
}

class _ScreenAwalState extends State<ScreenAwal> {
  int indexArab = 2;

  List<String> arabicSegments = [
    'أَسْأَلُ اللهَ',
    'الْكَرِيمَ',
    'رَبَّ الْعَرْشِ الْعَظِيمِ',
    'أَنْ يَتَوَلَّاكَ',
    'فِي الدُّنْيَا وَالآخِرَةِ،',
    'وَأَنْ يَجْعَلَكَ',
    'مُبَارَكًا',
    'أَيْنَمَا كُنْتَ،',
    'وَأَنْ يَجْعَلَكَ مِمَّنْ',
    'إِذَا أُعْطِيَ',
    'شَكَرَ،',
    'وَإِذَا ابْتُلِيَ',
    'صَبَرَ،',
    'وَإِذَا أذَنبَ',
    'اسْتَغْفَرَ.',
    'فَإِنَّ هَؤُلاءِ الثَّلاثَ',
    'عُنْوَانُ',
    'السَّعَادَةِ',
  ];

  List<int> mapping = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    10,
    9,
    12,
    11,
    14,
    13,
    15,
    16,
    17,
  ];

  List<String> bahasaSegments = [
    'Saya memohon kepada Allah',
    'Yang Maha Pemurah',
    'Tuhan ‘Arsy yang agung',
    'agar memeliharamu',
    'di dunia dan akhirat,',
    'menjadikanmu',
    'diberkahi',
    'di manapun berada,',
    'menjadikanmu',
    'bersyukur',
    'saat diberi nikmat,',
    'bersabar',
    'ketika ditimpa musibah,',
    'dan meminta ampun',
    'jika berbuat dosa.',
    'Tiga hal terakhir yang telah disebutkan di atas',
    'adalah kunci',
    'kebahagiaan.',
  ];

  List<Widget> renderArab() {
    List<Widget> temp = [];
    for (var i = 0; i < arabicSegments.length; i++) {
      Color warna = i == indexArab ? Colors.black38 : Colors.transparent;
      String data = arabicSegments[i];
      Widget widget = Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
        child: InkWell(
          onTap: () {
            if (indexArab != i) {
              indexArab = i;
            } else {
              indexArab = null;
            }
            print("Print here");
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: warna,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                '$data',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      );
      temp.add(widget);
    }
    return temp;
  }

  List<Widget> renderIndo() {
    List<Widget> temp = [];
    for (var i = 0; i < bahasaSegments.length; i++) {
      //# JANGAN LEWAT WOY< KALAU, NULL
      Color warna;
      if (indexArab == null) {
        warna = Colors.transparent;
      } else {
        warna = i == mapping[indexArab]
            ? Color.fromRGBO(0, 182, 251, 0.9)
            : Colors.transparent;
      }

      String data = bahasaSegments[i];
      Widget widget = Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: warna,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '$data',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
      temp.add(widget);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Qawaidul Arba',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(236, 241, 245, 1),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 241, 245, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 182, 251, 0.9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(20),
                              child: DefaultTextStyle(
                                style:
                                    Theme.of(context).textTheme.title.copyWith(
                                          color: Colors.white,
                                        ),
                                child: Wrap(
                                  textDirection: TextDirection.rtl,
                                  spacing: 4,
                                  alignment: WrapAlignment.start,
                                  runSpacing: 4,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  // textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    ...renderArab(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Wrap(
                                textDirection: TextDirection.ltr,
                                children: <Widget>[
                                  ...renderIndo(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
