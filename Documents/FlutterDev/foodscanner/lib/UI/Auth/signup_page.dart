import 'package:flutter/material.dart';
import 'package:foodscanner/FirebaseService/auth_manager.dart';
import 'package:foodscanner/Shared/loading.dart';


class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final AuthManager _authManager = AuthManager();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String name = "";
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return isloading ? Loading(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text("Sign up"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            children: <Widget>[
               Icon(
                Icons.water_damage,
                color: Colors.green[200],
                size: 200.0,
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 20.0,
                child: TextFormField(
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (value) => value.isEmpty ? "Please fill the email form": null,
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(Icons.email, color: Colors.green[100],),
                      ),
                      labelText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),

               Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 20.0,
                child: TextFormField(
                  onChanged: (value){
                    setState(() {
                      name = value;
                    });
                  },
                  validator: (value) => value.isEmpty ? "Please fill the name form": null,
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(Icons.email, color: Colors.green[100],),
                      ),
                      labelText: "Name",
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 20.0,
                child: TextFormField(
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (value) => value.length <= 5 ? "the password at least more than 5" : null,
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(Icons.lock, color: Colors.green[100],),
                      ),
                    labelText: "Password",contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0))),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                elevation: 5.0,
                color: Colors.blueGrey,
                child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                onPressed: () async {
                
                    if(_formKey.currentState.validate()){
                      // print("email: "+ email + ", password: "+password);
                      setState(() {
                        isloading = true;
                      });
                      bool isRegistered = await _authManager.registerAccount(email, password, name);
                      await _authManager.signout();
                      if(isRegistered){
                        Scaffold.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      }else{
                         showAlertDialog(context);
                         setState(() {
                           isloading = false;
                         });
                      }

                    }
                  
                }),
               SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("I already have an account, Sign in here!", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),))
            ],
          ),
        ),
      ),
    );
  }

  Widget snackBar = SnackBar(content: Text("You have register"));

    //Alert Dialog
  showAlertDialog(BuildContext context) {
    //action buttons
    Widget actionButton = FlatButton(
        onPressed: () {},
        child: Text(
          "OK",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ));

    //Alert Text
    AlertDialog alert = AlertDialog(
      title: Text("Whoops"),
      content: Text("The account already existed."),
      actions: [actionButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}