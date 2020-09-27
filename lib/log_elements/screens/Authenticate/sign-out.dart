import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/services/auth.dart';

class Signout extends StatefulWidget {
  @override
  _SignoutState createState() => _SignoutState();
}

class _SignoutState extends State<Signout> {

  List<AboutUs> details = [
    AboutUs(
        image: Image.asset('assets/images/symptoms/cough.png'), text: 'Rikesh Karmacharya'),
    AboutUs(
        image: Image.asset('assets/images/symptoms/fever.png'),
        text: 'Hrishav Raghu Shrestha'),
    AboutUs(
        image: Image.asset('assets/images/symptoms/sore_throath.png'),
        text: 'Shubh Raj Dhital'),
  ];

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: width *1.2,
              child: ListView.builder(
                padding: EdgeInsets.only(left: width * 0.05),
                itemBuilder: (context, index) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: width * 0.4, maxHeight: width * 0.4),
                      child: DetailsCard(
                        image: details[index].image,
                        text: details[index].text,
                      ),
                    );
                  });
                },
                itemCount: details.length,
                scrollDirection: Axis.vertical,
              ),
            ),
            SizedBox(height: 15,),
            RawMaterialButton(
              onPressed: () async{
                try{
                  await _auth.signout();
                }catch(e){
                  print(e.toString());
                  return null;
                }
              },
              elevation: 2.0,
              fillColor: Colors.red,
              child: Icon(
                Icons.cancel,
                size: 35.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            SizedBox(height: 5,),
            Text(
              'Log Out',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUs {
  Image image;
  String text;

  AboutUs({this.image, this.text});
}

class DetailsCard extends StatelessWidget {
  DetailsCard({
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
          top: height * 0.05,
          child: Container(
            height: height * 0.16,
            width: width * 0.9,
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
          left: width * 0.01,
          child: SizedBox(
              child: image,
              height: height * 0.16,
            ),
        ),
        Positioned(
          left: width * 0.35,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'ProductSans',
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}

