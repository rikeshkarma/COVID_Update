import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  List<Symptoms> symptoms = [
    Symptoms(
        image: Image.asset('assets/images/symptoms/cough.png'), text: 'Cough'),
    Symptoms(
        image: Image.asset('assets/images/symptoms/fever.png'),
        text: 'High Fever'),
    Symptoms(
        image: Image.asset('assets/images/symptoms/sore_throath.png'),
        text: 'Sore Throat'),
  ];

  List<Prevention> preventions = [
    Prevention(
        imageSource: 'assets/images/prevention/wash_hands.png',
        text: 'Wash Your hands Often'),
    Prevention(
        imageSource: 'assets/images/prevention/use_masks.png',
        text: 'Wear A Face Mask'),
    Prevention(
        imageSource: 'assets/images/prevention/cover_when_sneezing.png',
        text: 'Always Cover Your Cough or Sneeze'),
    Prevention(
        imageSource: 'assets/images/prevention/avoid_contacts.png',
        text: 'Avoid Contact With Sick People'),
  ];

  List<HelplineNumber> helplineNumbers = [
    HelplineNumber(number: '1115 and 1133', time: '6 AM to 10 PM'),
    HelplineNumber(
        number: '9851255839, 9851255837, 9851255834', time: '8 AM to 8 PM'),
    HelplineNumber(
        number: '9843812308, 9863815908, 98015638', time: '12 AM to 11:59 AM'),
    HelplineNumber(
        number: 'Search for MoHP Nepal COVID-19',
        time: "on Viber to join the Ministry's community"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              buildTitle(title: 'Symptoms', width: width),
              SizedBox(
                height: width * 0.54,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: width * 0.05),
                  itemBuilder: (context, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: width * 0.4, maxHeight: width * 0.4),
                        child: SymptomsCard(
                          image: symptoms[index].image,
                          text: symptoms[index].text,
                        ),
                      );
                    });
                  },
                  itemCount: symptoms.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              buildTitle(
                title: 'Preventions',
                width: width,
              ),
              Container(
                height: width * 0.52,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: width * 0.05),
                  itemBuilder: (context, index) {
                    return PreventionCard(
                      imageSource: preventions[index].imageSource,
                      text: preventions[index].text,
                    );
                  },
                  itemCount: preventions.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              buildTitle(
                title: 'Helpline Numbers',
                width: width,
              ),
              Column(
                children: List.generate(
                  helplineNumbers.length,
                  (index) => buildHelplineNumber(
                    time: helplineNumbers[index].time,
                    number: helplineNumbers[index].number,
                    width: width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildHelplineNumber({String number, String time, double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              fontSize: 19,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(width: width * 0.06),
          Text(
            '($time)',
            style: TextStyle(
              fontSize: 18,
              color: const Color(0xFF7777FF),
            ),
          ),
          SizedBox(width: 100),
        ],
      ),
    );
  }

  Padding buildTitle({String title, double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.04, horizontal: width * 0.05),
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

class HelplineNumber {
  String time;
  String number;

  HelplineNumber({this.number, this.time});
}

class Symptoms {
  Image image;
  String text;

  Symptoms({this.image, this.text});
}

class SymptomsCard extends StatelessWidget {
  SymptomsCard({
    this.image,
    this.text,
  });

  Image image;
  String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          left: width * 0.05,
          top: height * 0.05,
          child: Container(
            height: height * 0.16,
            width: width * 0.35,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: const Color(0xFF7777FF),
              shadows: [
                BoxShadow(
                  color: const Color(0x33000000),
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  spreadRadius: 7,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: width * 0.1,
          right: width * 0.05,
          child: Column(
            children: <Widget>[
              SizedBox(
                child: image,
                height: height * 0.16,
              ),
              Text(
                text,
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Prevention {
  String imageSource;
  String text;

  Prevention({this.imageSource, this.text});
}

class PreventionCard extends StatelessWidget {
  const PreventionCard({this.imageSource, this.text});

  final String imageSource;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: width * 0.04,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          width: width * 0.25,
          height: width * 0.25,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            shadows: [
              BoxShadow(
                color: const Color(0x22000000),
                blurRadius: 15,
                spreadRadius: 5,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: FittedBox(
            child: Image.asset(imageSource),
          ),
        ),
        Flexible(
          child: Container(
            width: width * 0.3,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: width * 0.042, fontFamily: 'ProductSans'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
