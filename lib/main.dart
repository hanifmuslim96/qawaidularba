import 'package:flutter/material.dart';
import 'package:qawaidularba/home.dart';
import 'pendahuluan.dart';

void main() {
  runApp(AplikasiBermanfaat());
}

class AplikasiBermanfaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manfaat',
      home: HomeScreen(),
      routes: {
        'intro': (BuildContext context) {
          return SectionSlider();
        },
        'about': (BuildContext context) {
          return Text('data');
        },
      },
    );
  }
}
