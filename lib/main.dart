import 'package:csci380project/pages/homepage.dart';
import 'package:csci380project/rest_api/pythonconnect.dart';
import 'package:csci380project/rest_api/rest_api.dart';
import 'package:csci380project/rest_api/serpapi.dart';
import 'package:csci380project/test/dbtestpage.dart';
import 'package:csci380project/test/testpages.dart';
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
      theme: ThemeData(
        primaryColor: Colors.green[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.green[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green[700]),
        )),
      ),
      home: HomePage(),
    );
  }
}
