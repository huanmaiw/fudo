class OrderItem {
  final String title;
  final double price;
  final int quantity;
  final String image;

  OrderItem({required this.title, required this.price, required this.quantity, required this.image});
}

class Order {
  final String id;
  final String date;
  final String status;
  final List<OrderItem> items;
  final int totalItems;
  final double totalPrice;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.items,
    required this.totalItems,
    required this.totalPrice,
  });
}