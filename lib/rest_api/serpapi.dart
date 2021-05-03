import 'dart:convert';
import 'dart:ffi';

import 'package:csci380project/resources/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

final String apiKey =
    "94621f137b7cd96a1d3cd6fa3e283f19d0f5b3b9cc222e6b9f0d0135471557e6";

Future<List<Store>> getStores(String upc) async {
  String productId = await getProductId(upc);

  final String host =
      'https://serpapi.com/search.json?engine=google_product&product_id=$productId&offers=1&gl=us&hl=en&api_key=$apiKey';

  final response = await http.get(
    Uri.parse(host),
  );

  if (response.statusCode == 200) {
    // List<Store> storeList;
    // int length =
    //     jsonDecode(response.body)['sellers_results']['online_sellers'].length;
    // for (int i = 0; i < length; i++) {
    //   storeList.add(Store.fromJson(jsonDecode(response.body), i));
    // }
    // return storeList;
    Iterable l = jsonDecode(response.body)['sellers_results']['online_sellers'];
    List<Store> storeList =
        List<Store>.from(l.map((model) => Store.fromJson(model)));
    return storeList;
  } else
    throw Exception('Failed to connect to server');
}

Future<String> getProductId(String upc) async {
  final loc = "New+York";
  final String host =
      "https://serpapi.com/search.json?q=$upc+upc&tbm=shop&hl=en&gl=us&api_key=$apiKey";

  final response = await http.get(
    Uri.parse(host),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['shopping_results'][0]['product_id'];
  } else
    throw Exception('Failed to connect to server');
}

//https://serpapi.com/search.json?engine=google_product&product_id=3352396703961210433&offers=1&gl=us&hl=en&api_key=94621f137b7cd96a1d3cd6fa3e283f19d0f5b3b9cc222e6b9f0d0135471557e6

//https://serpapi.com/search.json?q=051000000118&loc=New+York&tbm=shop&hl=en&gl=us&api_key=94621f137b7cd96a1d3cd6fa3e283f19d0f5b3b9cc222e6b9f0d0135471557e6

//https://serpapi.com/search.json?engine=google_product&product_id=3352396703961210433&offers=1&gl=us&hl=en&api_key=94621f137b7cd96a1d3cd6fa3e283f19d0f5b3b9cc222e6b9f0d0135471557e6
