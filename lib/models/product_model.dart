import 'package:elevate_task/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String category;
  final double price;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}
