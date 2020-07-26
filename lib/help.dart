import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
//  List<Symptoms> symptoms = [
//    Symptoms(),
//    Symptoms(),
//    Symptoms(),
//  ];
//
//  List<Preventions> preventions = [
//    Preventions(),
//    Preventions(),
//    Preventions(),
//  ];

  List<HelplineNumbers> helplineNumbers = [
    HelplineNumbers(number: '1115 and 1133', time: '6 AM to 10 PM'),
    HelplineNumbers(
        number: '9851255839, 9851255837, 9851255834', time: '8 AM to 8 PM'),
    HelplineNumbers(
        number: 'Search for MoHP Nepal COVID-19',
        time: "on Viber to join the Ministry's community"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              buildTitle(
                title: 'Helpline Numbers',
              ),
              Column(
                children: List.generate(
                  helplineNumbers.length,
                  (index) => buildHelplineNumber(
                    time: helplineNumbers[index].time,
                    number: helplineNumbers[index].number,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildHelplineNumber({String number, String time}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              fontSize: 19,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 10),
          Text(
            time,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF7777FF),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTitle({String title}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HelplineNumbers {
  String number;
  String time;

  HelplineNumbers({this.number, this.time});
}
