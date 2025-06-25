import 'package:elevate_task/models/product_model.dart';
import 'package:flutter/material.dart';

class LikesViewModel extends ChangeNotifier {
  final List<ProductModel> _likes = [];

  List<ProductModel> get likes => _likes;

  void toggleLike(ProductModel product) {
    if (_likes.contains(product)) {
      _likes.remove(product);
    } else {
      _likes.add(product);
    }
    notifyListeners();
  }
}
