import 'package:flutter/material.dart';
import 'package:meals_app/product/pizza_products.dart';

class AppFavoriteProducts extends ChangeNotifier {
  
  final List<Product> _myFavoriteProductsList = [];

  //Getters
  List<Product> get myFavoriteProductsList => _myFavoriteProductsList;
  bool isInFavourites(String name) => _myFavoriteProductsList.where((element) => element.name == name).isNotEmpty;

  //Setters

  void toggle(Product product) {
    if (!isInFavourites(product.name!)) {
      addFavoriteItem(product);
    } else {
      removeFavoriteItem(product);
    }
  }

  void addFavoriteItem(Product product) {
    _myFavoriteProductsList.add(product);
    notifyListeners();
  }

  void removeFavoriteItem(Product product) {
    _myFavoriteProductsList.remove(product);
    product.piece = 0;
    notifyListeners();
  }
}
