import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID UPDATE'),
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber,
            child: Text('CONFIRMED'),
          ),
          Container(
            height: 50,
            color: Colors.amber,
            child: Text('RECOVERED'),
          ),
          Container(
            height: 50,
            color: Colors.amber,
            child: Text('DECREASED'),
          ),
        ],
      ),
    );
  }
}
