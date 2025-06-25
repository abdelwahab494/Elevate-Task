import 'package:elevate_task/models/product_model.dart';
import 'package:elevate_task/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _service = ProductService();
  late Future<List<ProductModel>> _productsFuture;
  String _selectedCategory = "All";
  final List<String> categories = [
    "All",
    "Men's clothing",
    "Women's clothing",
    "Electronics",
    "Jewelery",
  ];

  ProductViewModel() {
    _productsFuture = _service.fetchProducts();
  }

  Future<List<ProductModel>> get productsFuture => _productsFuture;

  String get selectedCategory => _selectedCategory;

  List<String> get categoriesList => categories;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<ProductModel> filterProducts(List<ProductModel> products) {
    if (_selectedCategory == "All") return products;
    return products
        .where((product) =>
            product.category.toLowerCase() == _selectedCategory.toLowerCase())
        .toList();
  }
}