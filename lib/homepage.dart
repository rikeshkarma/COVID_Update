import 'package:flutter/material.dart';
import 'package:covidupdate/stats.dart';
import 'package:covidupdate/health.dart';
import 'package:covidupdate/news.dart';
import 'package:covidupdate/help.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Stats(),
    Health(),
    News(),
    Help(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.announcement,
              color: Colors.redAccent,
            ),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.healing,
              color: Colors.redAccent,
            ),
            title: Text('Health'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.new_releases,
              color: Colors.redAccent,
            ),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              color: Colors.redAccent,
            ),
            title: Text('Help'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
