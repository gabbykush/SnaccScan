import 'dart:convert';
import 'dart:ffi';

import 'package:csci380project/resources/nutrientlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<NutrientList> fetchFood(String upc) async {
  final String host =
      'https://edamam-food-and-grocery-database.p.rapidapi.com/parser?upc=$upc';

  final response = await http.get(
    Uri.parse(host),

    // Send authorization headers to the backend.
    headers: {
      'x-rapidapi-key': "c8020b0493msh924c70201e1450ap1b6736jsnab38a50cf69f",
      'x-rapidapi-host': "edamam-food-and-grocery-database.p.rapidapi.com"
    },
  );

  if (response.statusCode == 200) {
    //print(NutrientList.fromJson(jsonDecode(response.body)));
    return NutrientList.fromJson(jsonDecode(response.body));
  } else
    throw Exception('Failed to connect to server');
}

Future<String> getName(String upc) async {
  final String host =
      'https://edamam-food-and-grocery-database.p.rapidapi.com/parser?upc=$upc';

  final response = await http.get(
    Uri.parse(host),

    // Send authorization headers to the backend.
    headers: {
      'x-rapidapi-key': "c8020b0493msh924c70201e1450ap1b6736jsnab38a50cf69f",
      'x-rapidapi-host': "edamam-food-and-grocery-database.p.rapidapi.com"
    },
  );

  if (response.statusCode == 200) {
    //print(NutrientList.fromJson(jsonDecode(response.body)));
    return jsonDecode(response.body)['hints'][0]['food']['label'];
  } else
    throw Exception('Failed to connect to server');
}
