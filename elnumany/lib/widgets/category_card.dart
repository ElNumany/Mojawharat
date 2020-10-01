import 'package:elnumany/const.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Image image;
  final String name;
  CategoryCard({this.image, this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: kMainColor, boxShadow: [
          BoxShadow(color: kSecoundColor, spreadRadius: 2, blurRadius: 5)
        ]),
        width: 150,
        height: 100,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: image,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: kSecoundColor),
            ),
          ],
        ),
      ),
    );
  }
}
