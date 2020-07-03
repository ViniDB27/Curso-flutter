import 'dart:math';

import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem{
  final String id;
  final String productId;
  final String title;
  final int quatity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quatity,
    @required this.price
  });
}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items{
    return {..._items};
  }

  int get itemsCount{
    return _items.length;
  }

  double get totalAmount{
    double total = 0.0;
    _items.forEach((key, cartItem) { 
        total += (cartItem.price * cartItem.quatity);
    });
    return total;
  }

  void addItem(Product product){
    if(_items.containsKey(product.id)){
      _items.update(product.id, (existingItem){
        return CartItem(
          id: existingItem.id,
          productId: existingItem.productId, 
          title: existingItem.title, 
          quatity: existingItem.quatity + 1, 
          price: existingItem.price,
        );
      });
    }else{
      _items.putIfAbsent(product.id, () => CartItem(
        id: Random().nextDouble().toString(), 
        productId: product.id,
        title: product.title, 
        quatity: 1, 
        price: product.price,
      ));
    }


  notifyListeners();

  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clear(){
    _items ={};
    notifyListeners();
  }

}