import 'package:flutter/material.dart';
import 'package:foodscanner/FirebaseService/scanner_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class QRscanner extends StatefulWidget {
  QRscanner({Key key}) : super(key: key);

  @override
  _QRscannerState createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {

  String result = "";

   Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("QRscanner"),backgroundColor: Colors.green[200]
    ),
    body:  Center(
        child: Text("Result",
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[200],
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () async {
         result = await ScannerManager().qrScanner();
         if(result != null){
           _launchInBrowser(result);
         }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}