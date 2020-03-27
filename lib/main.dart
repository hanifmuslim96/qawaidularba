import 'package:flutter/material.dart';

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
  int indexArab = null;
  var birulight = Color.fromRGBO(0, 182, 251, 0.9);
  double slidervalue = 1;

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
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        child: Material(
          textStyle: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
              bottom: Radius.circular(10),
            ),
          ),
          color: warna,
          // borderRadius: BorderRadius.all(Radius.circular(10)),

          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            splashColor: Colors.black38,
            onTap: () {
              if (indexArab != i) {
                indexArab = i;
              } else {
                indexArab = null;
              }
              print("Print here");
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                '$data',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 20 * slidervalue,
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
      Color warna, warnafont;
      double bgklik;
      if (indexArab == null) {
        warna = Colors.transparent;
        bgklik = 0;
        warnafont = Colors.black;
      } else {
        warna = i == mapping[indexArab]
            ? Color.fromRGBO(0, 182, 251, 0.9)
            : Colors.transparent;
        bgklik = i == mapping[indexArab] ? 4 : 0;
        warnafont = i == mapping[indexArab]
            ? warnafont = Colors.white
            : warnafont = Colors.black;
      }

      String data = bahasaSegments[i];
      Widget widget = Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: warna,
          ),
          padding: EdgeInsets.symmetric(horizontal: bgklik),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: Text(
              '$data',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: warnafont,
                fontSize: 14 * slidervalue,
              ),
            ),
          ),
        ),
      );
      temp.add(widget);
    }
    return temp;
  }

  nitipFunction(x) {
    print(x);
    slidervalue = x;
    setState(() {});
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Flybtn(
            birulight: birulight,
            pintuNitipFunction: nitipFunction,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 245, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Al Qawaidul Arba',
            style: TextStyle(color: Colors.black),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 241, 245, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: birulight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.all(10),
                            child: DefaultTextStyle(
                              style: Theme.of(context).textTheme.title.copyWith(
                                    color: Colors.white,
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    '  Arabic',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                    textDirection: TextDirection.rtl,
                                    spacing: 1,
                                    alignment: WrapAlignment.start,
                                    runSpacing: 1,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    // textDirection: TextDirection.rtl,
                                    children: <Widget>[
                                      ...renderArab(),
                                    ],
                                  ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'Indonesian',
                                  style: TextStyle(
                                    color: birulight,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  textDirection: TextDirection.ltr,
                                  children: <Widget>[
                                    ...renderIndo(),
                                  ],
                                ),
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
          Text('sumber : muslim.or.id'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: birulight,
        splashColor: Colors.black38,
        child: Icon(
          Icons.text_fields,
          size: 20,
        ),
        onPressed: _showModalSheet,
      ),
    );
  }
}

class Flybtn extends StatefulWidget {
  const Flybtn({
    Key key,
    @required this.birulight,
    @required this.pintuNitipFunction,
  }) : super(key: key);

  final Color birulight;
  final Function pintuNitipFunction;

  @override
  _FlybtnState createState() => _FlybtnState();
}

class _FlybtnState extends State<Flybtn> {
  double slidervalue = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: Slider(
          value: slidervalue,
          onChanged: (x) {
            widget.pintuNitipFunction(x);
            print(x);
            slidervalue = x;
            setState(() {});
          },
          divisions: 4,
          min: 0.8,
          max: 1.2,
        ),
      ),
    );
  }
}
