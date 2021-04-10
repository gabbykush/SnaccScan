import 'package:csci380project/database/FoodProduct.dart';
import 'package:csci380project/database/database.dart';
import 'package:flutter/material.dart';

class DatabaseTestPage extends StatefulWidget {
  @override
  _DatabaseTestPageState createState() => _DatabaseTestPageState();
}

class _DatabaseTestPageState extends State<DatabaseTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQLite")),
      body: FutureBuilder<List<FoodProduct>>(
        future: FoodDatabase.db.getAllFoods(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FoodProduct>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                FoodProduct item = snapshot.data[index];
                return ListTile(
                  title: Text(item.productName),
                  leading: Text(item.upc.toString()),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          FoodProduct rnd =
              new FoodProduct(upc: 101, productName: 'TestProduct2');
          await FoodDatabase.db.insertFood(rnd);
          setState(() {});
        },
      ),
    );
  }
}
