import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/Controller/cart_controller.dart';

import '../../temp_model/cart_item_model.dart';

class CartItemTile extends StatelessWidget {
  final int index;
  final CartItemModel item;

  const CartItemTile({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Checkbox(
            value: controller.isChecked[index],
            onChanged: (value) => controller.isChecked[index] = value ?? false,
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(item.image, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontSize: 14)),
                Text(item.variant, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Row(
                  children: item.variantOptions
                      .map((option) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(option, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')} đ",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20),
                          onPressed: () => controller.removeItem(index),
                        ),
                        Obx(() => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 16),
                                onPressed: () => controller.decreaseQty(index),
                              ),
                              Text(controller.quantities[index].toString(), style: const TextStyle(fontSize: 14)),
                              IconButton(
                                icon: const Icon(Icons.add, size: 16),
                                onPressed: () => controller.increaseQty(index),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
