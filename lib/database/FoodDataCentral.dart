//API Key
//BDqSPsxibzAbHuqBr0tCpy1sydmhD3pgwrv4atHu
//
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Album {
  //nutritional value fields
  final int fdc_id;
  final int gtin_upc;
  final int serving_size;
  final String serving_size_unit;

  Album(
      {@required this.fdc_id,
      @required this.gtin_upc,
      @required this.serving_size,
      @required this.serving_size_unit});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        fdc_id: json['fdc_id'],
        gtin_upc: json['gtin_upc'],
        serving_size: json['serving_size'],
        serving_size_unit: json['serving_size_unit']);
  }
}

Future<Album> fetchAlbum() async {}
