import 'package:flutter/material.dart';
import 'package:foodscanner/FirebaseService/auth_manager.dart';
import 'package:foodscanner/FirebaseService/firestore_manager.dart';
import 'package:foodscanner/Models/userdata.dart';
import 'package:foodscanner/Models/users.dart';
import 'package:foodscanner/UI/Home/dash_tile.dart';
import 'package:foodscanner/UI/Shop/shop_page.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key, this.username}) : super(key: key);

  final Users username;

  @override
  Widget build(BuildContext context) {
 
    return StreamProvider<UserData>.value(
        value: FirestoreManager(usernameEmail: username.userEmail).streamDataRetriever,
           child:Scaffold(
              appBar: AppBar(
                title: Text("Dashboard"),
                leading: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () async{
                      await AuthManager().signout();
                      showAlertDialog(context);
                    }),
                backgroundColor: Colors.green[200],
                actions: [
                  // not using for now
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(username.userEmail),
                      Padding(
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      )
                    ],
                  )
                  */
                ],
              ),
              body: DashTile(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopePage()),
                    );
                },
                child: Icon(
                  Icons.store,
                  size: 50.0,
                ),
                backgroundColor: Colors.green[300],
              ),
            ));
          }
        

  //Alert Dialog
  showAlertDialog(BuildContext context) {
    final AuthManager _authManager = AuthManager();
    //action buttons
    Widget actionButton = FlatButton(
        onPressed: () async {
          await _authManager.signout();
          Navigator.pop(context);
        },
        child: Text(
          "OK",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ));

    Widget cancelButton = FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Cancel",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ));

    //Alert Text
    AlertDialog alert = AlertDialog(
      title: Text(
        "Hey!",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
      ),
      content: Text(
        "Do you really want to log out ?",
        style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w800),
      ),
      actions: [cancelButton, actionButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
