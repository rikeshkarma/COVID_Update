import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/screens/Authenticate/Forgotten.dart';
import 'package:covidupdate/log_elements/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covidupdate/log_elements/shared/constants.dart';
import 'package:covidupdate/log_elements/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //textfield state
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF7777FF),
        elevation: 0.0,
        title: Text('Sign In',style: TextStyle(color: Colors.white,),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person_add,color: Colors.white,),
            label: Text('Sign Up',style: TextStyle(color: Colors.white),),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val)=>val.isEmpty?'Email Field is emply':null,
                  onChanged: (val){
                    setState(()=>email=val);
                  }
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val)=>val.length<6?'Password must be 6+ characters':null,
                  onChanged: (val){
                    setState(()=>password=val);
                  }
                ),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.only(right: 20),
                child: Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>Forgotten()));
                    },
                  child: Text('Forgot Password?',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                  ),
                ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.blue[250],
                  child: Text('Sign In',style: TextStyle(color: Color(0xFF7777FF),),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()) {
                      setState(()=>loading=true);
                      dynamic result = await _auth.signInWithEmailandPassword(email, password);
                      if (result==null){
                        setState((){
                        error='Does not match any registered accounts';
                        loading=false;

                        });
                      }
                    }

                  },
                ),
                SizedBox(height: 12),
                Text(error,
                style: TextStyle(color: Colors.red,fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
