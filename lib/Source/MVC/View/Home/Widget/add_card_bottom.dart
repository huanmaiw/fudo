import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/virian_chip.dart';

import 'mvc/add_to_cart_controller.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final String title;
  final String image;
  final String price;


  AddToCartBottomSheet({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);

  final controller = Get.put(AddToCartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProductInfo(),
          const SizedBox(height: 16),
          _buildPriceAndQuantity(),
          const Divider(height: 30),
          _buildTotal(),
          const SizedBox(height: 16),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildProductInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 80, width: 80),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                children: const [
                  VariantChip(label: "Thùng 20 gói"),
                  VariantChip(label: "Phân loại 2"),
                  VariantChip(label: "Phân loại 3"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${double.tryParse(price.replaceAll('.', '').replaceAll('đ', '').trim())?.toStringAsFixed(0)} đ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Obx(() => Row(
          children: [
            const Icon(Icons.delete, color: Colors.grey),
            const SizedBox(width: 12),
            QtyButton(icon: Icons.remove, onTap: controller.decreaseQty),
            const SizedBox(width: 8),
            Text("${controller.quantity.value}", style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            QtyButton(icon: Icons.add, onTap: controller.increaseQty),
          ],
        )),
      ],
    );
  }

  Widget _buildTotal() {
    return Obx(() {
      double priceAsDouble = double.tryParse(price.replaceAll('.', '').replaceAll('đ', '').trim()) ?? 0.0;
      double total = controller.calculateTotal(priceAsDouble);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Tổng", style: TextStyle(fontSize: 18)),
          Text(
            "${total.toStringAsFixed(0)} đ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      );
    });
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Add to cart logic
            },
            icon: const Icon(Icons.add),
            label: const Text("Thêm vào giỏ hàng"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {
            // TODO: Buy Now logic
          },
          child: const Icon(Icons.shopping_bag_outlined),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
