import 'dart:convert';

import 'package:elnumany/Models/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {@required this.amount,
      @required this.id,
      @required this.products,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

//////////////// Adding Orders /////////
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = "https://elnu-many-573e8.firebaseio.com/orders.json";
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'id': DateTime.now().toString(),
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.name,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderItem(
              amount: total,
              id: json.decode(response.body)['name'],
              products: cartProducts,
              dateTime: timeStamp));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
