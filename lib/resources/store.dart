import 'package:flutter/material.dart';

class Store {
  final String name;
  final String rating;
  final String link;
  final String basePrice;
  final String shipping;
  final String tax;
  final String totalPrice;

  Store(
      {@required this.name,
      @required this.rating,
      @required this.link,
      @required this.basePrice,
      @required this.shipping,
      @required this.tax,
      @required this.totalPrice});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
        name: json['name'],
        rating: json['rating'],
        link: json['link'],
        basePrice: json['base_price'],
        shipping: json['additional_price']['shipping'],
        tax: json['additional_price']['tax'],
        totalPrice: json['total_price']);
  }
}
