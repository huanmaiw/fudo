// views/home_combo_suggestion_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mvc/combo_controller.dart';

class HomeComboSuggestionSection extends StatelessWidget {
  const HomeComboSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final comboController = Get.put(ComboController());

    return Column(
      children: [
        _sectionTitle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Obx(() {
            return Row(
              children: comboController.comboSuggestions.map((combo) {
                return Expanded(
                  child: _ComboCard(
                    title: combo.title,
                    image: combo.image,
                    price: combo.price,
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ],
    );
  }

  Widget _sectionTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Image.asset("assets/voucher/bt8.png"),
          const SizedBox(width: 4),
          const Text(
            "Combo gợi ý",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Spacer(),
          const Text("Xem thêm", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

class _ComboCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  const _ComboCard({
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Image.asset(image, height: 100),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: const Text(
              "Combo",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
