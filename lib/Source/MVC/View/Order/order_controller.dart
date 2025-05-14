import 'package:get/get.dart';

import 'order.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  var filteredOrders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    orders.assignAll([
      Order(
        id: "#7864",
        date: "10/02/2022",
        status: "Đang xử lý",
        items: [
          OrderItem(title: "Túi khăn giấy tre Fudo Tissue - 04 Gói rút", price: 100000, quantity: 2, image: "assets/pub/card1.jpg"),
          OrderItem(title: "Túi khăn giấy tre Fudo Tissue - 04 Gói rút", price: 100000, quantity: 2, image: "assets/pub/card1.jpg"),
        ],
        totalItems: 3,
        totalPrice: 117000,
      ),
      Order(
        id: "#7865",
        date: "11/02/2022",
        status: "Đang vận chuyển",
        items: [
          OrderItem(title: "Khăn giấy tre Fudo - 06 Gói", price: 150000, quantity: 1, image: "assets/pub/card1.jpg"),
        ],
        totalItems: 1,
        totalPrice: 150000,
      ),
      Order(
        id: "#7866",
        date: "12/02/2022",
        status: "Hoàn thành",
        items: [
          OrderItem(title: "Khăn giấy tre Fudo - 10 Gói", price: 200000, quantity: 2, image: "assets/pub/card1.jpg"),
        ],
        totalItems: 2,
        totalPrice: 400000,
      ),
      Order(
        id: "#7867",
        date: "13/02/2022",
        status: "Đã hủy",
        items: [
          OrderItem(title: "Khăn giấy tre Fudo - 02 Gói", price: 50000, quantity: 1, image: "assets/pub/card1.jpg"),
        ],
        totalItems: 1,
        totalPrice: 50000,
      ),
    ]);
    filteredOrders.assignAll(orders);
    filterOrdersByStatus("Đang xử lý");
  }

  void filterOrdersByStatus(String status) {
    filteredOrders.assignAll(orders.where((order) => order.status == status).toList());
  }
}