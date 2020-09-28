import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CovidUserData extends StatefulWidget {
  @override
  _CovidUserDataState createState() => _CovidUserDataState();
}

class _CovidUserDataState extends State<CovidUserData> {
  @override
  Widget build(BuildContext context) {

    final UserData=Provider.of<QuerySnapshot>(context);
    print(UserData.docs);
    return Container();
  }
}
