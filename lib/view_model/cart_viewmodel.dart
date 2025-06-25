import 'package:elevate_task/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel extends ChangeNotifier {
  final List<ProductModel> _cart = [];

  List<ProductModel> get cart => _cart;

  void addToCart(ProductModel product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cart.remove(product);
    notifyListeners();
  }

  double totalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cart.length; i++) {
      totalPrice = totalPrice + _cart[i].price;
    }
    return totalPrice;
  }
}
