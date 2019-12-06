import 'package:flutter/material.dart';
import 'package:ballers/screens/HomeScreen.dart';
import 'package:ballers/screens/DetailScreen.dart';
import 'package:ballers/screens/screen.dart';
import 'package:ballers/screens/notfound/notfound_page.dart';
import 'package:ballers/utils/uiData.dart';

class Router {
  static Route<dynamic> generateRoute(settings) {
    switch (settings.name) {
      case UIData.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case UIData.viewRoute:
        return MaterialPageRoute(builder: (_) => Screen());
        break;
      case UIData.detailRoute:
        return MaterialPageRoute(builder: (_) => DetailScreen());
    }
  }

  static Route<dynamic> unknownRoute(settings) {
    return new MaterialPageRoute(builder: (context) => new NotFoundPage());
  }
}
