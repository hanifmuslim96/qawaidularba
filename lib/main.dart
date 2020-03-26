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

class ScreenAwal extends StatelessWidget {
  List<String> arabicSegments = [
    'أَسْأَلُ اللهَ',
    'الْكَرِيمَ',
    'رَبَّ الْعَرْشِ الْعَظِيمِ',
  ];
  List<String> bahasaSegments = [
    'saya memohon kepada Allah',
    'yang Maha Pemurah',
    'Pemilik Arsy yang agung',
  ];

  
  List<Widget> renderArab() {
    List<Widget> temp = [];
    for (var i = 0; i < arabicSegments.length * 4; i++) {
      String data = arabicSegments[i % 3] +" ";
      Widget widget = Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
        child: InkWell(
          onTap: () {
            print("Print here");
          },
          child: Text(
            '$data',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 42,
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
        title: Text('Qawaidul Arba'),
      ),
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Wrap(
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
              Wrap(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: InkWell(
                      onTap: () {
                        print("Print here");
                      },
                      child: Text('${bahasaSegments[0] + " "}'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: InkWell(
                        onTap: () {
                          print("Print here");
                        },
                        child: Text('${bahasaSegments[1] + " "}')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: InkWell(
                        onTap: () {
                          print("Print here");
                        },
                        child: Text('${bahasaSegments[2] + " "}')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
