import 'package:elnumany/Models/orders.dart';
import 'package:elnumany/Models/products.dart';
import 'package:elnumany/Screens/cart_screen.dart';
import 'package:elnumany/Screens/homepage.dart';
import 'package:elnumany/Screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "AlNu'many",
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: HomePage(),
        routes: {
          DetailPage.routeName: (context) => DetailPage(),
          CartScreen.routename: (context) => CartScreen(),
        },
      ),
    );
  }
}
