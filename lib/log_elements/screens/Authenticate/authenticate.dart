import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/screens/Authenticate/register.dart';
import 'package:covidupdate/log_elements/screens/Authenticate/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignin=true;
  void toggleView(){
    setState(()=>showSignin= !showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin){
      return SignIn(toggleView:toggleView);
    } else{
      return register(toggleView:toggleView);
    }
  }
}
