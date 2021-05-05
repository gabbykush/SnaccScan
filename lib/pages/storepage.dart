import 'package:csci380project/resources/store.dart';
import 'package:csci380project/rest_api/serpapi.dart';
import 'package:csci380project/widgets/storecontainer.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Future<List<Store>> storeList;
  String upc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    upc = ModalRoute.of(context).settings.arguments as String;
    storeList = getStores(upc);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
      ),
      body: FutureBuilder(
        future: storeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Column(
                children: [
                  Text('Could not find stores'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          storeList = getStores(upc);
                        });
                      },
                      child: Text('Refresh'))
                ],
              );
            }
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return StoreContainer(store: snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) return Text("${snapshot.error}");
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
