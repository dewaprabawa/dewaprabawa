import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class ScannerManager{
  Future<String> qrScanner() async {
    String result = "";
    try{
      String qRString = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
      result = qRString;
      print("Result QRcode, ${result}");
    }on PlatformException catch(ex){
      print(ex.message);
    }
    return result;
  }
}