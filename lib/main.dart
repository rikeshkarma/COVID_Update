import 'package:flutter/material.dart';
import 'package:covidupdate/log_elements/models/user.dart';
import 'package:covidupdate/log_elements/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:covidupdate/log_elements/services/auth.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CovidUpdate());
}

class CovidUpdate extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Member>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
