import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_card_bottom.dart';

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
                child: _BestSellerCard(
                  title: 'Thùng 20 gói khăn giấy tre TISSUEPack',
                  image: 'assets/pub/hot1.jpg',
                  price: '165.000đ',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _BestSellerCard(
                  title: 'Combo mình ên\n02 túi lớn TISSUEPack x 01 lốc',
                  image: 'assets/pub/hot2.png',
                  price: '220.000đ',
                  isCombo: true,
                ),
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
  final String title;
  final String image;
  final String price;
  final bool isCombo;

  const _BestSellerCard({
    required this.title,
    required this.image,
    required this.price,
    this.isCombo = false,
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
                    price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        AddToCartBottomSheet(
                          title: title,
                          image: image,
                          price: price,
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
  }
}
