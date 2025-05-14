// views/home_category_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Product/product_page.dart';
import 'mvc/category_controller.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Column(
      children: [
        _sectionTitle(context),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.3,
              ),
              itemCount: categoryController.categories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final category = categoryController.categories[index];
                return _CategoryItem(
                  title: category.title,
                  image: category.image,
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Image.asset("assets/voucher/bt7.png"),
          const SizedBox(width: 4),
          const Text("Danh mục", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductPage())),
            child: const Text("Xem thêm", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const _CategoryItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(image)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
