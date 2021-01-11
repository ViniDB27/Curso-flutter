import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  
  final CartItem cartItem;

  CartItemWidget(this.cartItem);
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss:(_){
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tem certeza que deseja excuilr esse item?'),
            content: Text('Você podera adcionar o item novamento caso queira!'),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop(false);
                }, 
                child: Text('Cancelar')
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop(true);
                }, 
                child: Text('Excluir')
              ),
            ],
          )
        );
      },
      onDismissed: (_){
        Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId);
      },
      key: ValueKey(cartItem.id),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${cartItem.price}'),
                ),
              ),
            ),
            title: Text(cartItem.title),
            subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quatity}'),
            trailing: Text('${cartItem.quatity}x'),
          ),
        ),
      ),
    );
  }
}