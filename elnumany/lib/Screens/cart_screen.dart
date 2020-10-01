import 'package:elnumany/Models/cart.dart';
import 'package:elnumany/Models/orders.dart';
import 'package:elnumany/const.dart';
import 'package:elnumany/widgets/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routename = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          title: Text(
            "Cart Screen",
            style: TextStyle(color: kSecoundColor, fontSize: 20),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, i) => CartItems(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].name,
                        cart.items.values.toList()[i].quantity,
                      )),
            ),
            CheckOutButton(
              cart: cart,
            ),
            // FlatButton(
            //     color: klony,
            //     onPressed: () {

            //     },
            //     child: Text(
            //       "Order One",
            //       style: TextStyle(color: kMainColor, fontSize: 20),
            //     ))
          ],
        ));
  }
}

class CheckOutButton extends StatefulWidget {
  final Cart cart;

  const CheckOutButton({@required this.cart});
  @override
  _CheckOutButtonState createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: kSecoundColor,
        onPressed: widget.cart.totalAmount <= 0
            ? null
            : () async {
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.items.values.toList(), widget.cart.totalAmount);
                widget.cart.clear();
              },
        child: Text("Check Out",
            style: TextStyle(color: kMainColor, fontSize: 20)));
  }
}
