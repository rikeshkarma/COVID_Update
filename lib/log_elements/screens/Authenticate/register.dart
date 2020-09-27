import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/services/auth.dart';
import 'package:covidupdate/log_elements/shared/constants.dart';
import 'package:covidupdate/log_elements/shared/loading.dart';

class register extends StatefulWidget {

  final Function toggleView;
  register({this.toggleView});

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  final AuthService _auth =AuthService();
  final _formKey = GlobalKey<FormState>();

  String email='';
  String password='';
  String error='';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF7777FF),
        elevation: 0.0,
        title: Text('Register To COVID Update',style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: Text('Sign In',style: TextStyle(color: Colors.white),),
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
                    validator: (val)=>val.isEmpty ? 'Enter an Email':null,
                    onChanged: (val){
                      setState(()=>email=val);
                    }
                ),
                SizedBox(height: 20),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText:'Password'),
                    validator: (val)=>val.length<6 ? 'Password needs to be longer than 6 characters':null,
                    obscureText: true,
                    onChanged: (val){
                      setState(()=>password=val);
                    }
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.blue[250],
                  child: Text('Register',style: TextStyle(color: Color(0xFF7777FF),),
                  ),
                  onPressed: () async{
                    if (_formKey.currentState.validate()){
                      setState(() {
                        loading=true;
                      });
                      dynamic result = await _auth.registerWithEmailandPassword(email,password);
                      if (result==null){
                        setState(() {
                          error ='please supply a valid email';
                          loading=false;
                        });
                    }
                    }
                  },
                ),
                SizedBox(height: 12),
                Text(
                  error,
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
