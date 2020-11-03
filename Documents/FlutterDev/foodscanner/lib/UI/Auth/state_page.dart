import "package:flutter/material.dart";
import 'package:foodscanner/Models/users.dart';
import 'package:foodscanner/UI/Auth/auth.dart';
import 'package:foodscanner/UI/Home/dash_board.dart';
import 'package:provider/provider.dart';

class StatePage extends StatelessWidget {
  const StatePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final currentUser = Provider.of<Users>(context);

    if(currentUser != null){
      return Dashboard(username: currentUser, key: key,);
    }else{
      return Auth();
    }
  }
}
