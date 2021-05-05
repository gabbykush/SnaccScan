import 'package:csci380project/database/FoodProduct.dart';
import 'package:csci380project/database/database.dart';
import 'package:csci380project/resources/routes.dart';
import 'package:flutter/material.dart';

class FoodHistoryPage extends StatefulWidget {
  @override
  _FoodHistoryPageState createState() => _FoodHistoryPageState();
}

class _FoodHistoryPageState extends State<FoodHistoryPage> {
  Future<List<FoodProduct>> historyList;
  String upc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    upc = ModalRoute.of(context).settings.arguments as String;
    historyList = FoodDatabase.db.getAllFoods();

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: FutureBuilder(
        future: historyList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('No History'),
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                FoodProduct product = snapshot.data[index];
                return Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              product.productName,
                              style: TextStyle(fontSize: 20),
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.nutritionalPage,
                                        arguments: product.upc);
                                  },
                                  child: Text("Go")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    FoodDatabase.db.deleteFood(product.upc);
                                    setState(() {});
                                  },
                                  child: Text('Delete')),
                            )
                          ],
                        ),
                      ],
                    ));
              },
            );
          } else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
