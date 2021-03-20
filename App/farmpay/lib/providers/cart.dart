import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,

  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items{
    return{..._items};
}


int get itemCount {
    return _items.length;
}

double get totalAmount {
    var total=0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
}


void addItem (String cropId, double price, String title,) {
    if(_items.containsKey(cropId)){
      _items.update(cropId, (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity+1,
          price: existingCartItem.price
      ),
      );
    }
    else {
      _items.putIfAbsent(cropId , () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
      )
      );
    }
    notifyListeners();
}

void removeItem(String cropId) {
    _items.remove(cropId);
    notifyListeners();
}

}