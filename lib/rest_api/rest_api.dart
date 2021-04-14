import 'dart:convert';
import 'dart:ffi';

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

class NutrientList {
  final double ENERC_KCAL;
  final double FAT;
  final double FASAT;
  final double FATRN;
  final double FAMS;
  final double FAPU;
  final double CHOCDF;
  final double FIBTG;
  final double SUGAR;
  final double PROCNT;
  final double CHOLE;
  final double NA;
  final double CA;
  final double K;
  final double FE;
  final double VITC;

  NutrientList(
      {@required this.ENERC_KCAL,
      @required this.FAT,
      @required this.FASAT,
      @required this.FATRN,
      @required this.FAMS,
      @required this.FAPU,
      @required this.CHOCDF,
      @required this.FIBTG,
      @required this.SUGAR,
      @required this.PROCNT,
      @required this.CHOLE,
      @required this.NA,
      @required this.CA,
      @required this.K,
      @required this.FE,
      @required this.VITC});

  factory NutrientList.fromJson(Map<String, dynamic> json) {
    return NutrientList(
        ENERC_KCAL: json['hints'][0]['food']['nutrients']['ENERC_KCAL'],
        FAT: json['hints'][0]['food']['nutrients']['FAT'],
        FASAT: json['hints'][0]['food']['nutrients']['FASAT'],
        FATRN: json['hints'][0]['food']['nutrients']['FATRN'],
        FAMS: json['hints'][0]['food']['nutrients']['FAMS'],
        FAPU: json['hints'][0]['food']['nutrients']['FAPU'],
        CHOCDF: json['hints'][0]['food']['nutrients']['CHOCDF'],
        FIBTG: json['hints'][0]['food']['nutrients']['FIBTG'],
        SUGAR: json['hints'][0]['food']['nutrients']['SUGAR'],
        PROCNT: json['hints'][0]['food']['nutrients']['PROCNT'],
        CHOLE: json['hints'][0]['food']['nutrients']['CHOLE'],
        NA: json['hints'][0]['food']['nutrients']['NA'],
        CA: json['hints'][0]['food']['nutrients']['CA'],
        K: json['hints'][0]['food']['nutrients']['K'],
        FE: json['hints'][0]['food']['nutrients']['FE'],
        VITC: json['hints'][0]['food']['nutrients']['VITC']);
  }
}
