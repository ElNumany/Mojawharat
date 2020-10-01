import 'package:elnumany/widgets/category_card.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryCard(
            image: Image.asset(
              "icons/ring.jpg",
              filterQuality: FilterQuality.high,
              height: 50,
            ),
            name: "Rings",
          ),
          CategoryCard(
            image: Image.asset(
              "icons/neck.jpg",
              filterQuality: FilterQuality.high,
              height: 50,
            ),
            name: "Necklace",
          ),
          CategoryCard(
            image: Image.asset(
              "icons/baracelet.jpg",
              filterQuality: FilterQuality.high,
              height: 50,
            ),
            name: "Bracelet",
          ),
          CategoryCard(
            image: Image.asset(
              "icons/Erring.jpg",
              filterQuality: FilterQuality.high,
              height: 50,
            ),
            name: "Earring",
          ),
        ],
      ),
    );
  }
}
