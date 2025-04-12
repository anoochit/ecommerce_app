import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get total => _items.fold(0, (sum, item) => sum + item.total);

  void addItem(Product product) {
    final existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _items.add(existingItem);
    }
    existingItem.quantity++;
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity < 1) return;

    final existingItem = _items.firstWhere(
      (item) => item.product.id == product.id,
    );
    existingItem.quantity = quantity;
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }
}
