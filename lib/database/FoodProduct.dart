import 'dart:convert';

FoodProduct clientFromJson(String str) {
  final jsonData = json.decode(str);
  return FoodProduct.fromMap(jsonData);
}

String clientToJson(FoodProduct data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class FoodProduct {
  final int upc;
  final String productName;

  FoodProduct({this.upc, this.productName});

  Map<String, dynamic> toMap() {
    return {
      'universal_product_code': upc,
      'product_name': productName,
    };
  }

  factory FoodProduct.fromMap(Map<String, dynamic> json) => new FoodProduct(
        upc: json["universal_product_code"],
        productName: json["Product_Name"],
      );
}
