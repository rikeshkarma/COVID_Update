import 'package:covidupdate/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CovidUpdate());
}

class CovidUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID Update',
      home: Home(),
    );
  }
}
