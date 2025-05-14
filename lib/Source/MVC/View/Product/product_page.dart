import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Home/bottomnavbar.dart';
import 'product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.find instead of Get.put to avoid re-initialization
    final ProductController controller = Get.find<ProductController>();

    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage())),
                  child: Image.asset("assets/icon/back.png", width: 40, height: 40)),
              const Text(
                'Sản phẩm',
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
            child: Obx(() {
              return TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: controller.categories.keys.map((category) {
                  return Tab(
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ),
        body: Obx(() {
          return TabBarView(
            children: controller.categories.entries.map((entry) {
              final products = entry.value;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: products.isEmpty
                    ? const Center(child: Text("Chưa có sản phẩm"))
                    : GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 120,
                                    ),
                                    child: Image.asset(
                                      product.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Flexible(
                                  child: Text(
                                    product.title,
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.add, color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}