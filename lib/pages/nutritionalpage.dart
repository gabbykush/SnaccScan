import 'package:csci380project/resources/list_all_nutrients.dart';
import 'package:csci380project/resources/nutrient.dart';
import 'package:csci380project/resources/routes.dart';
import 'package:flutter/material.dart';

class NutritionalPage extends StatefulWidget {
  @override
  _NutritionalPageState createState() => _NutritionalPageState();
}

class _NutritionalPageState extends State<NutritionalPage> {
  String upc;
  Future<List<Nutrient>> nutrientList;

  @override
  Widget build(BuildContext context) {
    upc = ModalRoute.of(context).settings.arguments as String;
    nutrientList = listAllNutrients(upc);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrients'),
      ),
      body: FutureBuilder(
        future: nutrientList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    height: 500,
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, int index) {
                            Nutrient nutrient = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration:
                                    new BoxDecoration(color: Colors.white),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      nutrient.name + ':',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                    Text(
                                      nutrient.value.toString() +
                                          ' ' +
                                          nutrient.unit,
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.storePage,
                          arguments: upc);
                    },
                    child: Text("Find Stores"))
              ],
            );
          } else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
