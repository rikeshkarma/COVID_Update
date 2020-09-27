import 'package:firebase_auth/firebase_auth.dart';
import 'package:covidupdate/log_elements/models/user.dart';
import 'package:covidupdate/log_elements/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  Member _userFromFirebaseUser(User user) {
    return user!=null ? Member(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Member> get user {
    return _auth.authStateChanges()
        //.map((User user)=>_userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in annoymously
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign with email and password
  Future signInWithEmailandPassword(String Email,String Password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: Email, password: Password);
      User user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //register with email and password
  Future registerWithEmailandPassword(String Email,String Password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: Email,
        password: Password
      );
      User user = result.user;
      //creating a database for the specific user with uid
      await databaseService(uid: user.uid).userUpdateData('Untitled name', 100, 'Unknown');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}
