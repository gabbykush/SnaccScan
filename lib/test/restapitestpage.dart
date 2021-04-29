import 'package:csci380project/rest_api/serpapi.dart';
import 'package:flutter/material.dart';

class RestAPITestPage extends StatefulWidget {
  @override
  _RestAPITestPageState createState() => _RestAPITestPageState();
}

class _RestAPITestPageState extends State<RestAPITestPage> {
  Future<String> productId;

  @override
  void initState() {
    super.initState();
    productId = getProductId('044000031114');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: productId,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            } else if (snapshot.hasError) return Text("${snapshot.error}");
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
