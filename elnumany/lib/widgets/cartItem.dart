import 'package:elnumany/Models/cart.dart';
import 'package:elnumany/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productid;
  final double price;
  final int quantity;
  final String name;
  CartItems(this.id, this.name, this.price, this.productid, this.quantity);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: klony,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context).removeItem(productid);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text("\$$price"),
          ),
          title: Text(name),
          subtitle: Text("Total : \$${(quantity * price)}"),
          trailing: Text("$quantity"),
        ),
      ),
    );
  }
}
