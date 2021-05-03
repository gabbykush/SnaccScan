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

void main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'food_database.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        FoodDatabase.db.createTable,
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

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
