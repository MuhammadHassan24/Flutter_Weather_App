import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 1;
  int get counter => _counter;
  addValue() {
    _counter++;
    notifyListeners();
  }
}
