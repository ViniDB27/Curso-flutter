import 'dart:math';

import 'package:flutter/cupertino.dart';

import './cart.dart';

class Order{



  final String id;
  final double total;
  final List<CartItem> product;
  final DateTime date;


  Order({
    this.id,
    this.total,
    this.product,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items =[];

  List<Order> get items{
    return [..._items];
  }

  int get itemsCount{
    return _items.length;
  }
  void addOrder(List<CartItem> products, double total){
    _items.insert(0, Order(
      id: Random().nextDouble().toString(),
      total: total,
      date: DateTime.now(),
      product: products,
    ));

    notifyListeners();
  }
}