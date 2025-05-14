// models/product_model.dart
class ProductModel {
  final String title;
  final String image;
  final double price;
  final bool isCombo;

  ProductModel({
    required this.title,
    required this.image,
    required this.price,
    this.isCombo = false,
  });
}
