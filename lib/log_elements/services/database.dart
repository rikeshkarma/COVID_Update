import 'package:cloud_firestore/cloud_firestore.dart';

class databaseService{

  final String uid;
  databaseService({this.uid});

  //collection reference
  final CollectionReference CovidData = FirebaseFirestore.instance.collection('UserData');

  Future userUpdateData(String Name,int Age, String Location) async{
    return await CovidData.doc(uid).set({
      'Name':Name,
      'Age':Age,
      'Location':Location,
    });
  }
  Stream<QuerySnapshot> get UserData{
    return CovidData.snapshots();
  }
}