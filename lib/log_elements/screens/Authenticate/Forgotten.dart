import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/screens/Authenticate/sign_in.dart';
import 'package:covidupdate/log_elements/screens/wrapper.dart';
import 'package:covidupdate/log_elements/shared/constants.dart';

class Forgotten extends StatefulWidget {
  @override
  _ForgottenState createState() => _ForgottenState();
}

class _ForgottenState extends State<Forgotten> {
  final _formkey=GlobalKey<FormState>();
  String email ='';

  void _showDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Check Mail'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>Wrapper()));
              },
            )
          ],

        )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body:Container(
        padding:EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Form(
            key: _formkey,
            child:Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Text("A recovery mail will be sent to the registered account",style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val)=>val.isEmpty?'Enter email':null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.white,
                  child: Text("Submit",style: TextStyle(color: Color(0xFF7777FF),fontWeight: FontWeight.bold)),
                  onPressed: ()async{
                    if(_formkey.currentState.validate()){
                      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                      var SuccessMessage='A Password Reset Link has been sent to your email';
                      _showDialog(SuccessMessage);
                    }
                  },
                )
              ],
          ),
        )
      )
    );
  }
}
