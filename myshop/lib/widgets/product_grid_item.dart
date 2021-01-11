import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';
import '../utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
  final Product product = Provider.of<Product>(context, listen: false);
  final Cart cart = Provider.of<Cart>(context, listen: false);
    
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DATAIL,
              arguments: product,
            );
          },
          child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder:(ctx, product, _)=> IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border), 
              onPressed: ()=> product.toggleFavorite(),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart), 
            onPressed: (){
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Produto adcionado com sucesso!', textAlign: TextAlign.center,),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'DESFAZER', 
                    onPressed: (){
                      cart.removeSingleItem(product.id);
                    }
                  ),
                ),
              );
              cart.addItem(product);
            },
          ),
        ),
      ),
    
    );
  }
}