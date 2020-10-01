import 'package:elnumany/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/products.dart';
import '../const.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return Container(
      height: 300,
      child: GridView.builder(
        physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: Container(
            decoration: BoxDecoration(color: kMainColor, boxShadow: [
              BoxShadow(color: kSecoundColor, spreadRadius: 2, blurRadius: 5)
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductItem(
                imageUrl: products[index].imageUrl,
                name: products[index].name,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
