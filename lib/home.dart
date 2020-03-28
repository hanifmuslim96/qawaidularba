import 'package:flutter/material.dart';
import 'package:qawaidularba/pendahuluan.dart';

class HomeScreen extends StatelessWidget {
  Color biru = Color.fromRGBO(0, 182, 251, 0.9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biru,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.white38,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Assalamu'alaykum,",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Ahlan wa Sahlan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: 250,
                        child: Text(
                          '“Dan Aku tidak menciptakan jin dan manusia melainkan supaya mereka beribadah kepada-Ku (saja)”\n(QS.Adz-Dzaariyaat: 56)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        width: 250,
                        child: Text(
                          'القواعد الأربع',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'AraHamahKilania',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                      child: Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 241, 245, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SectionSlider();
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'المقدمـة',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'AraHamahKilania',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Pendahuluan',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 241, 245, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'القاعدة الأولى',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'AraHamahKilania',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Kaidah Pertama',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 241, 245, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'القاعدة الثانية',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'AraHamahKilania',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Kaidah Kedua',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 241, 245, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'القاعدة الثالثة',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'AraHamahKilania',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Kaidah Ketiga',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 241, 245, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'القاعدة الرابعة',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'AraHamahKilania',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Kaidah Keempat',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
