import 'package:flutter/material.dart';
import 'package:foodscanner/UI/Auth/signin_page.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool isSignin = false;

  void isSignORregister(){
    setState(() {
      isSignin = !isSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: SigninPage(),
    );
  }
}