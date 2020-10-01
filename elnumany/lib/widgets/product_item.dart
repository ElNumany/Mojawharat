import 'package:elnumany/Models/products.dart';
import 'package:elnumany/Screens/products_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  ProductItem({@required this.name, @required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailPage.routeName, arguments: pdt.id);
        },
      ),
    );
  }
}
