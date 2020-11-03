import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodscanner/FirebaseService/firestore_manager.dart';
import 'package:foodscanner/Models/users.dart';

class AuthManager {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Users _getUseremailFromFirebase(User u){
    FirestoreManager(usernameEmail: u.email);
    return u != null ? Users(u.email) : null;
  }

  Stream<Users> get currentUser{
    return _authentication.authStateChanges().map((User u) => _getUseremailFromFirebase(u));
  }

  Future<bool> registerAccount(String email, String password, String name) async {
    try {

      if(await FirestoreManager().checkIfExist(email)){
        return false;
      }else{
      UserCredential result = await _authentication
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await FirestoreManager(usernameEmail: user.email).updateUserData("10000", email, name);
      print("your account is success in registration " + user.email);
      return _getUseremailFromFirebase(user) != null;
      }


    } catch (e) {

      print("Error occurred in registration Prosess" + e.toString());
      return false;

    }
  }

  Future signinAccount(String email, String password) async {
    try {
      UserCredential result = await _authentication.signInWithEmailAndPassword(
          email: email, password: password);
      User _user = result.user;
      print("your account is success in registration " + _user.email);
      return _getUseremailFromFirebase(_user);
    } catch (error) {
      print("Error occurred in loggin phase " + error.toString());
    }
  }

  Future signout() async{
    try{
      await _authentication.signOut();
    }catch(e){
      print("Error occurred in sign out");
    }
  }
}
