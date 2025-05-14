// views/home_best_seller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_card_bottom.dart';
import 'mvc/product_controller.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: const [
              Expanded(
                child: _BestSellerCard(),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _BestSellerCard(isCombo: true),
              ),
            ],
          ),
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
            "Bán chạy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Spacer(),
          const Text("Xem thêm", style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

class _BestSellerCard extends StatelessWidget {
  final bool isCombo;

  const _BestSellerCard({this.isCombo = false});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController1>();

    return Obx(() {
      final product = productController.product.value;
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
                Image.asset(product.image, height: 100),
                const SizedBox(height: 4),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.price.toStringAsFixed(0)} đ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          AddToCartBottomSheet(
                            title: product.title,
                            image: product.image,
                            price: product.price.toString(),
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isCombo)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: const Text(
                  "Combo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
