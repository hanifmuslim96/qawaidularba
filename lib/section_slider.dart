import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SectionSlider extends StatefulWidget {
  SectionSlider(this.index);
  final int index;
  @override
  _SectionSliderState createState() => _SectionSliderState();
}

class _SectionSliderState extends State<SectionSlider> {
  int indexArab = null;
  int indexSlide = 0;
  var birulight = Color.fromRGBO(0, 182, 251, 0.9);
  double slidervalue = 1;

  List<List<dynamic>> dataDalamList;

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

  List<Widget> renderArab(pintu) {
    List<Widget> temp = [];

    var rawKasarArabic = dataDalamList[pintu[2] - 1][0].split("*");

    for (var i = 0; i < rawKasarArabic.length; i++) {
      Color warna = i == indexArab ? Colors.black38 : Colors.transparent;
      String data = rawKasarArabic[i];
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

  List<Widget> renderIndo(pintu) {
    // print(pintu);

    List<Widget> temp = [];
    List<Widget> temp2 = [];

    var dataSlide = dataDalamList[pintu[2] - 1];
    var rawKasarBahasa = dataSlide[1].split("*");
    var rawMapping = dataSlide[3].split("*").map(int.parse).toList();
    var slideNoBerapa = dataSlide[2] - 1;

    print("Informasi : $indexSlide");
    print("Informasi : $slideNoBerapa");
    print("Informasi : ${slideNoBerapa == indexSlide}");

    for (var i = 0; i < rawKasarBahasa.length; i++) {
      //# JANGAN LEWAT WOY< KALAU, NULL
      Color warna, warnafont;
      double bgklik;
      if ((indexArab == null)) {
        warna = Colors.transparent;
        bgklik = 0;
        warnafont = Colors.black;
      } else if ((slideNoBerapa != indexSlide)) {
        warna = Colors.transparent;
        bgklik = 0;
        warnafont = Colors.black;
      } else {
        warna = i == rawMapping[indexArab] - 1
            ? Color.fromRGBO(0, 182, 251, 0.9)
            : Colors.transparent;
        bgklik = i == rawMapping[indexArab] - 1 ? 4 : 0;
        warnafont = i == rawMapping[indexArab] - 1
            ? warnafont = Colors.white
            : warnafont = Colors.black;
      }

      String data = rawKasarBahasa[i];
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
    print("KERENDER DONG");
    return temp;
  }

  nitipFunction(x) {
    // print(x);
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
            nitipValue: slidervalue,
          ),
        );
      },
    );
  }

  void parsecsv() {
    _parsecsv();
    // print("Print here");
  }

  Future<void> _parsecsv() async {
    String data =
        await rootBundle.loadString('./data/content${widget.index}.tsv');
    await Future.delayed(Duration(seconds: 2));
    List<List<dynamic>> _dataDalamList =
        CsvToListConverter(fieldDelimiter: "\t").convert(data);
    // print(_dataDalamList);
    _dataDalamList.removeAt(0);
    dataDalamList = _dataDalamList;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    parsecsv();
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    if (dataDalamList == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 245, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // actions: <Widget>[],
        title: Text(
          'Al Qawaidul Arba',
          style: TextStyle(color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          onPageChanged: (a) {
            print("Pindah Halaman");
            indexArab = null;
            indexSlide = a;
            setState(() {});
          },
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          // reverse: false,
          enableInfiniteScroll: false,
          items: dataDalamList.map((url) {
            // print(url);
            return Column(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                            ...renderArab(url),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                          ...renderIndo(url),
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
            );
          }).toList(),
        ),
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
    @required this.nitipValue,
  }) : super(key: key);

  final Color birulight;
  final Function pintuNitipFunction;
  final double nitipValue;

  @override
  _FlybtnState createState() => _FlybtnState();
}

class _FlybtnState extends State<Flybtn> {
  double slidervalue;

  @override
  void initState() {
    super.initState();
    slidervalue = widget.nitipValue;
  }

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
