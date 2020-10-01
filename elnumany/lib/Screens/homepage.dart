import 'package:elnumany/Screens/cart_screen.dart';
import 'package:elnumany/widgets/all_products.dart';
import 'package:elnumany/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:elnumany/const.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(),
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Mojawharat",
                style: TextStyle(
                    fontSize: 20, color: klony, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routename);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Category ",
                style: TextStyle(
                    fontSize: 30,
                    color: kSecoundColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Category(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Products",
                style: TextStyle(
                    fontSize: 40,
                    color: kSecoundColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(color: kMainColor, boxShadow: [
                BoxShadow(color: kSecoundColor, spreadRadius: 2, blurRadius: 5)
              ]),
              child: AllProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
