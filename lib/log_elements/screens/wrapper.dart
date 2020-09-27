import 'package:covidupdate/homepage.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/models/user.dart';
import 'package:covidupdate/log_elements/screens/Authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Member>(context);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    }
    else {
      return HomePage();
    }
  }
}
