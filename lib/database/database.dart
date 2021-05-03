import 'package:csci380project/database/FoodProduct.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class FoodDatabase {
  FoodDatabase._();
  static final FoodDatabase db = FoodDatabase._();

  final String createTable = 'CREATE TABLE Food_Product (' +
      'universal_product_code TEXT PRIMARY KEY, ' +
      'product_name TEXT' +
      ')';

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'food_database.db'),
      onCreate: (db, version) {
        return db.execute(createTable);
      },
      version: 1,
    );
  }

  insertFood(FoodProduct foodProduct) async {
    final Database db = await database;

    await db.insert('Food_Product', foodProduct.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<FoodProduct>> getAllFoods() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Food_Product');

    return List.generate(maps.length, (i) {
      return FoodProduct(
          upc: maps[i]['universal_product_code'],
          productName: maps[i]['product_name']);
    });
  }

  Future<FoodProduct> getFood(String upc) async {
    final Database db = await database;

    var res = await db.query("Food_Product",
        where: "universal_product_code = ?", whereArgs: [upc]);
    return res.isNotEmpty ? FoodProduct.fromMap(res.first) : -1;
  }

  deleteFood(String upc) async {
    final Database db = await database;
    db.delete("Food_Product",
        where: "universal_product_code = ?", whereArgs: [upc]);
  }

  deleteAll() async {
    final Database db = await database;
    db.delete("FoodProduct");
  }
}

//https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b
