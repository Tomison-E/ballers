import 'package:flutter/material.dart';

class Shuffle with ChangeNotifier {
  var list = [0, 1, 2];
  List<int> loc = [0, 2, 1];
  int index = 0;

  void move() {
    index++;
    for (int i = 0; i < list.length; i++) {
      loc[i] = list[(index - i) % 3];
    }
    notifyListeners();
  }

  void reverse() {
    index--;
    for (int i = 0; i < list.length; i++) {
      loc[i] = list[(index - i) % 3];
    }
    notifyListeners();
  }
}
