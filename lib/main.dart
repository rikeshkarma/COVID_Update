import 'package:flutter/material.dart';
import 'package:covidupdate/homepage.dart';

void main() {
  runApp(CovidUpdate());
}

class CovidUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID Update',
      home: HomePage(),
    );
  }
}
