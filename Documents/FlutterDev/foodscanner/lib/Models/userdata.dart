import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  final String balance;
  final String name;
  final String email;

  static const NAME = "name";
  static const BALANCE = "balance";
  static const EMAIL = "email";

  UserData({this.balance, this.name, this.email});

  factory UserData.fromMap(DocumentSnapshot data){
    return UserData(balance: data.data()[UserData.BALANCE] ?? "",name: data.data()[UserData.NAME] ?? "", email: data.data()[UserData.EMAIL] ?? "");
  }
  
}