import 'package:csci380project/pages/foodhistorypage.dart';
import 'package:csci380project/pages/homepage.dart';
import 'package:csci380project/pages/nutritionalpage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Routes {
  Routes._();
  static const String homePage = '/homepage';
  static const String foodHistoryPage = '/foodhistorypage';
  static const String nutritionalPage = '/nutritionalpage';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      homePage: (context) => HomePage(),
      foodHistoryPage: (context) => FoodHistoryPage(),
      nutritionalPage: (context) => NutritionalPage()
    };
  }
}
