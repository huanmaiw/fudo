import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/Widget/home_page.dart';
import 'order.dart';
import 'order_controller.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    final tabCategories = ["Đang xử lý", "Đang vận chuyển", "Hoàn thành", "Đã hủy"];

    return DefaultTabController(
      length: tabCategories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeContent())),
                child: Image.asset("assets/icon/back.png", width: 40, height: 40),
              ),
              const Text(
                'DS Đơn hàng',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_horiz, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.close, color: Colors.black),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              onTap: (index) {
                orderController.filterOrdersByStatus(tabCategories[index]);
              },
              tabs: tabCategories.map((category) {
                return Tab(
                  child: Text(
                    category,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        body: Obx(() {
          if (orderController.filteredOrders.isEmpty) {
            return const Center(child: Text("Không có đơn hàng nào"));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: orderController.filteredOrders.length,
            itemBuilder: (context, index) {
              final order = orderController.filteredOrders[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                order.id,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                order.date,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            order.status,
                            style: TextStyle(
                              color: order.status == "Đang xử lý"
                                  ? Colors.orange
                                  : order.status == "Đang vận chuyển"
                                  ? Colors.black
                                  : order.status == "Hoàn thành"
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (order.items.isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                order.items[0].image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.items.isNotEmpty ? order.items[0].title : "Không có sản phẩm",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  order.items.isNotEmpty ? "${order.items[0].price.toStringAsFixed(0)} đ" : "0 đ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  order.items.isNotEmpty ? "x${order.items[0].quantity}" : "x0",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${order.totalItems} sản phẩm",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                "Thành tiền ${order.totalPrice.toStringAsFixed(0)} đ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (order.status == "Đang vận chuyển")
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Đã nhận",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              if (order.status == "Hoàn thành" || order.status == "Đã hủy")
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.green),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Text(
                                        "Mua lại",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.green,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}