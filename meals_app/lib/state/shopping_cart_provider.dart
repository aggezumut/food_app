import 'package:flutter/material.dart';
import 'package:meals_app/product/pizza_products.dart';

class AppShoppingCartState with ChangeNotifier {
  final List<Product> _addingProductsList = [];
  double totalPrice = 0.0;

  //Getters
  List<Product> get addingProductsList => _addingProductsList;

  //Setters


  void addProducts(Product product) {
    product.piece++;
    _addingProductsList.add(product);
    totalPrice = totalPrice + product.price;
    notifyListeners();
  }

  void removeProducts(Product product) {
    _addingProductsList.remove(product);
    totalPrice = totalPrice - (product.price) * (product.piece);
    notifyListeners();
  }

  void increaseProductPiece(Product product) {
    product.piece++;
    totalPrice = totalPrice + (product.price);
    notifyListeners();
  }

  void decreaseProductPiece(Product product) {
    product.piece--;
    totalPrice = totalPrice - (product.price);
    notifyListeners();
  }
}
