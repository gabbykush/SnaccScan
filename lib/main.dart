import 'package:csci380project/pages/homepage.dart';
import 'package:csci380project/resources/routes.dart';
//import 'package:csci380project/rest_api/pythonconnect.dart';
import 'package:csci380project/rest_api/rest_api.dart';
import 'package:csci380project/rest_api/serpapi.dart';
import 'package:csci380project/test/dbtestpage.dart';
import 'package:csci380project/test/scannertestpage.dart';
//import 'package:csci380project/test/testpages.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

import 'database/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes.getRoutes(),
      theme: ThemeData(
        primaryColor: Colors.green[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Color.fromARGB(255, 191, 235, 186),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green[700]),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green[700]),
          minimumSize:
              MaterialStateProperty.resolveWith((states) => Size(200, 100)),
        )),
      ),
      home: HomePage(),
    );
  }
}
