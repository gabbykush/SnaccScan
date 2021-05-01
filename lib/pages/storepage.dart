import 'package:csci380project/resources/store.dart';
import 'package:csci380project/rest_api/serpapi.dart';
import 'package:csci380project/widgets/storecontainer.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  final String upc;

  StorePage({Key key, @required this.upc}) : super(key: key);
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Future<List<Store>> storeList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeList = getStores(widget.upc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
      ),
      body: FutureBuilder(
        future: storeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
