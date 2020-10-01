import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String category;
  final String name;
  final String description;
  final String imageUrl;
  final String price;
  Product(
      {@required this.price,
      @required this.category,
      @required this.description,
      @required this.id,
      @required this.imageUrl,
      @required this.name});
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        price: "50 \$",
        category: "Nicklace",
        description: "Nicklace 2020 Model Designed By ****",
        name: "Moon Neck",
        imageUrl:
            "https://cdn.shopify.com/s/files/1/0045/8352/2422/products/gold_Dainty_moon_pendant_necklace_by_Kelabu_jewellery_720x.jpg",
        id: "Moon Neck"),
    Product(
        price: "80 \$",
        category: "Nicklace",
        description: "Nicklace 2020 Model Designed By ****",
        id: "Rose Neck",
        imageUrl:
            "https://cdn.shopify.com/s/files/1/0045/8352/2422/products/Beauty_and_The_Beast_Enchanted_Rose_Pendant_Necklace_gold_720x.jpg",
        name: "Rose Neck"),
    Product(
        price: "90 \$",
        category: "Ring",
        description: "Ring 2020 Model Designed By ****",
        id: "Diamond Ring",
        imageUrl:
            "https://i.pinimg.com/564x/8a/eb/f2/8aebf2ba377ff95df7fe4dc038dab237.jpg",
        name: "Diamond Ring"),
    Product(
        price: "65 \$",
        category: "Earring",
        description: "Earring 2020 Model Designed By ****",
        id: "Simple Earring",
        imageUrl:
            "https://p1.pxfuel.com/preview/1003/897/209/diamond-earrings-elegant-jewellery.jpg",
        name: "Simple Earring"),
    Product(
        price: "110 \$",
        category: "Necklace",
        description: "Earring 2020 Model Designed By ****",
        id: "Diamond Nicklace",
        imageUrl:
            "https://marianilsdotter.com/wp-content/uploads/2020/03/Maria-Nilsdotter-Big-Claw-Pearl-Necklace-Silver-with-Pearl-Front-1440x1440.jpg",
        name: "Diamond Nicklace"),
    Product(
        price: "220 \$",
        category: "Ring",
        description: "Diamond Ring 2020 Model Designed By ****",
        id: "Diamond Ring",
        imageUrl:
            "https://www.vadimdaniel.com/wp-content/uploads/2017/05/studio-photography-in-montreal-for-jewelry-and-products.jpg",
        name: "Diamond Ring"),
  ];
  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
