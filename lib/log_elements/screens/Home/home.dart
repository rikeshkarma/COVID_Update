import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/screens/Home/Covid_User_List.dart';
import 'package:covidupdate/log_elements/services/auth.dart';
import 'package:covidupdate/log_elements/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Covid Update'),
          backgroundColor: Color(0xFF7777FF),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,),
              label: Text('Logout',style: TextStyle(color: Colors.white),),
              onPressed: () async{
                await _auth.signout();
              },
            )
          ],
        ),

      );
  }
}
