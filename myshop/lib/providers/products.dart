import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier{

  List<Product> _items = DUMMY_PRODUCTS;
  
  List<Product> get items => [..._items];

  int get itemsCount{
    return _items.length;
  }
  
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();  
  }
  

  void addProduct(Product product){
    _items.add(product);
  }
}

// bool _showFavotiteOnly = false;

  // void showFavotiteOnly(){
  //   _showFavotiteOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavotiteOnly = false;
  //   notifyListeners();
  // }