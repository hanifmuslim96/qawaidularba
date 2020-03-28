import 'package:flutter/material.dart';
import 'package:qawaidularba/home.dart';
import 'package:qawaidularba/section_slider.dart';

void main() {
  runApp(AplikasiBermanfaat());
}

class AplikasiBermanfaat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manfaat',
      home: HomeScreen(),
    );
  }
}
