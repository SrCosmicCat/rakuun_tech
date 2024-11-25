import 'dart:collection';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map> _cartItems = [];

  UnmodifiableListView<Map> get cartItems => UnmodifiableListView(_cartItems);

  double get price => _cartItems.fold<double>(0.0, (previousValue, element) => previousValue += element['precio'] * element['cantidad']);

  
  double get envio => 500 - price;

  void addItem(Map item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void reset() {
    _cartItems.clear();
    notifyListeners();
  }
  
  void removeItem(Map item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
