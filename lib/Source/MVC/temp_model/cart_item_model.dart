class CartItemModel {
  final String title;
  final String variant;
  final List<String> variantOptions;
  final double price;
  final String image;

  CartItemModel({
    required this.title,
    required this.variant,
    required this.variantOptions,
    required this.price,
    required this.image,
  });
}
