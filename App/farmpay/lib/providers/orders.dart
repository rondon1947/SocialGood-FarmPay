import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> crops;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.crops,
    @required this.dateTime,
});
}
class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem>cartCrops, double total) {
    _orders.insert(0,
        OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        crops: cartCrops,
        dateTime: DateTime.now())
    );
    notifyListeners();
  }
}