import 'package:flutter/material.dart';
import 'package:foodscanner/FirebaseService/auth_manager.dart';
import 'package:foodscanner/Shared/loading.dart';
import 'package:foodscanner/UI/Auth/signup_page.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthManager _authManager = AuthManager();

  String email = "";
  String password = "";
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return isloading ? Loading():Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text("Sign in"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
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
                  validator: (value) =>
                      value.isEmpty ? "Please fill the email form" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(
                          Icons.email,
                          color: Colors.green[100],
                        ),
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
                  validator: (value) => value.length <= 5
                      ? "the password at least more than 5"
                      : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(
                          Icons.lock,
                          color: Colors.green[100],
                        ),
                      ),
                      labelText: "Password",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0))),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  elevation: 5.0,
                  color: Colors.blueGrey,
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () async {
                    // print("email: " + email + ", password: " + password);
                   if(_formKey.currentState.validate()){

                       setState(() {
                         isloading = true;
                       });

                      dynamic res =
                        await _authManager.signinAccount(email, password);
                    if (res != null) {
                        print("Sign in Succeeds");
                    } else {
                      setState(() {
                        showAlertDialog(context);
                        isloading = false;
                      });
                    }
                   }
                  }),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    "Do not have an account, let's make one!",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w800),
                  ))
            ],
          ),
        ),
      ),
    );
  }

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
      content: Text("Could not sign in with those credentials."),
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
