import 'package:elnumany/widgets/cartItem.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;
  CartItem(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productID, String name, double price) {
    if (_items.containsKey(productID)) {
      _items.update(
          productID,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          productID,
          () => CartItem(
              id: DateTime.now().toString(),
              name: name,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    {
      if (_items.containsKey(id)) {
        return;
      }
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
