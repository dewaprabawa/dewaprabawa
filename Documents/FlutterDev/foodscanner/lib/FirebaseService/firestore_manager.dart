import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodscanner/Models/userdata.dart';
import 'package:foodscanner/Models/users.dart';


class FirestoreManager{

  final String usernameEmail;
  FirestoreManager({this.usernameEmail}); 

  CollectionReference userdata = FirebaseFirestore.instance.collection("userdata");

  Future updateUserData(String balance, String email, String name) async {
      return await userdata.doc(usernameEmail).set({
        "balance": balance,
        "email":email,
        "name":name,
        "update_date": DateTime.now()
      });
  }

  Future<bool> checkIfExist(String email) async {
    return userdata.doc(email).get().then((DocumentSnapshot value){
        if(value.exists){
          return true;
        }else{
          return false;
        }
    });
  }
  
  Stream<UserData> get streamDataRetriever{
    return userdata.doc(usernameEmail).snapshots().map((snap) => UserData.fromMap(snap));
  }
}