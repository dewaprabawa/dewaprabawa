import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodscanner/FirebaseService/auth_manager.dart';
import 'package:foodscanner/Models/users.dart';
import 'package:foodscanner/UI/Auth/state_page.dart';
import 'package:foodscanner/UI/Shop/shop_page.dart';
import 'package:provider/provider.dart';

import 'FirebaseService/firestore_manager.dart';
import 'Models/userdata.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers:[
            StreamProvider<Users>.value(value: AuthManager().currentUser),
          ], 
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minum Aja',
        theme: ThemeData(
   
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: StatePage(),
        home: StatePage()
      ),
    );
  }
}

