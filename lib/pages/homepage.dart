import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  ScanResult upc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Snacc Scan'),
          backgroundColor: Colors.green[700],
        ),
        body: Center(child: Column(children: <Widget>[
          Container(
            child: Text(upc?.rawContent ?? 'Click Scan'),
          ),
          Container(
            margin: EdgeInsets.all(25.0),
            child: OutlinedButton(
             child: Text("Scan New Barcode", style: TextStyle(fontSize: 20.0),),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
              ),
               onPressed: () async {
               upc = (await BarcodeScanner.scan()) as ScanResult;
               setState(() {});
               },
            ),
          ),
          Container(
            margin: EdgeInsets.all(25.0),
            child: OutlinedButton(
              child: Text("History of Products", style: TextStyle(fontSize: 20.0),),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
              ),
              onPressed: () {},
            ),
          )
        ]
        )
      )
    ));
  }
}
