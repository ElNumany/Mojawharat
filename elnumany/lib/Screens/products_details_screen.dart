import 'package:elnumany/Models/cart.dart';
import 'package:elnumany/Screens/cart_screen.dart';
import 'package:elnumany/const.dart';
import 'package:flutter/material.dart';
import 'package:elnumany/Models/products.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/productDetail";
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    final loadedProudct = Provider.of<Products>(context).findById(productID);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          title: Text(loadedProudct.name),
        ),
        body: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: kSecoundColor,
                  )
                ]),
                child: Image.network(loadedProudct.imageUrl)),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price Range",
                      style: TextStyle(color: kSecoundColor, fontSize: 20),
                    ),
                    Text(
                      "${loadedProudct.price}",
                      style: TextStyle(color: klony, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: TextStyle(
                    color: kSecoundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                loadedProudct.description,
                style: TextStyle(
                    color: kSecoundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routename);
          },
          child: Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          backgroundColor: kSecoundColor,
        ),
        bottomSheet: CircleAvatar(
          foregroundColor: kMainColor,
          backgroundColor: kMainColor,
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(color: kMainColor),
            child: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: kSecoundColor,
                  size: 30,
                ),
                onPressed: () {
                  cart.addItem(loadedProudct.id, loadedProudct.name,
                      loadedProudct.price.hashCode.ceilToDouble());
                }),
          ),
        ));
  }
}
