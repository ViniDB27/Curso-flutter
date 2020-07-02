import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menus/models/category.dart';

import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Menus',
              textAlign: TextAlign.center,
              ),
          ),
        ),
        body: GridView(
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((cat){
            return CategoryItem(cat);
          }).toList(),
      ),
    );
  }
}