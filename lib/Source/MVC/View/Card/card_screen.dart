// lib/modules/cart/view/cart_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/Controller/cart_controller.dart';


import 'cart_item_tile.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Giỏ hàng', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() => Column(
        children: [
          CheckboxListTile(
            value: controller.isChecked.every((e) => e),
            onChanged: controller.toggleAll,
            title: const Text("Chọn tất cả"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                final item = controller.cartItems[index];
                return CartItemTile(index: index, item: item);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tạm tính", style: TextStyle(color: Colors.grey)),
                    Text(
                      "${controller.totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')} đ",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("ĐẶT HÀNG", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
