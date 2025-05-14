import 'package:flutter/material.dart';

import 'virian_chip.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  const AddToCartBottomSheet({
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Sản phẩm
          Row(
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
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),

          // Giá + số lượng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Row(
                children: [
                  Icon(Icons.delete, color: Colors.grey),
                  const SizedBox(width: 12),
                  QtyButton(icon: Icons.remove),
                  const SizedBox(width: 8),
                  Text("1", style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  QtyButton(icon: Icons.add),
                ],
              )
            ],
          ),

          const Divider(height: 30),

          // Tổng cộng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tổng", style: TextStyle(fontSize: 18)),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),

          const SizedBox(height: 16),

          // Nút thêm và mua
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Thêm vào giỏ hàng",),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.shopping_bag_outlined),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
