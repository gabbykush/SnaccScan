import 'package:barcode_scan/barcode_scan.dart';
import 'package:csci380project/database/FoodProduct.dart';
import 'package:csci380project/database/database.dart';
import 'package:csci380project/resources/routes.dart';
import 'package:csci380project/rest_api/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String upc;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Snacc Scan'),
        //   backgroundColor: Colors.green[700],
        // ),
        body: Center(
            child: Column(children: <Widget>[
      Container(
          height: 200,
          width: 200,
          child: Image.asset('lib/assets/applogo.png')),
      Container(
        child: Text(
          'SnaccScan',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 40),
        ),
      ),
      Container(
        margin: EdgeInsets.all(20.0),
        child: OutlinedButton(
          child: Text(
            "Scan New Barcode",
            style: TextStyle(fontSize: 20.0),
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            //backgroundColor: Colors.teal,
          ),
          onPressed: () async {
            ScanResult barcodeScan = await BarcodeScanner.scan();
            upc = barcodeScan.rawContent.toString();
            name = await getName(upc);
            FoodProduct foodProduct =
                new FoodProduct(upc: upc, productName: name);
            await FoodDatabase.db.insertFood(foodProduct);
            Navigator.pushNamed(context, Routes.nutritionalPage,
                arguments: upc);
          },
        ),
      ),
      Container(
        margin: EdgeInsets.all(20.0),
        child: OutlinedButton(
          child: Text(
            "History of Products",
            style: TextStyle(fontSize: 20.0),
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            // backgroundColor: Colors.teal,
          ),
          onPressed: () {
            //Navigator.pushNamed(context, Routes.foodHistoryPage);
            Navigator.pushNamed(context, Routes.foodHistoryPage,
                arguments: '044000031114');
          },
        ),
      )
    ])));
  }
}
