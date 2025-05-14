import 'package:flutter/material.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/home_page.dart';
import 'package:tryhard/Source/MVC/View/Home/bottomnavbar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, List<Map<String, String>>> categories = {
      "Khăn giấy rút": [
        {
          "title": "Thùng 20 gói khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },
        {
          "title": "Thùng 20 gói khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },
        {
          "title": "Túi lớn 04 gói khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },
        {
          "title": "Combo 2 túi lớn khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },

      ],
      "Giấy cuộn": [
        {
          "title": "Túi lớn 04 gói khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },
      ],
      "Khăn giấy bỏ túi": [
        {
          "title": "Combo 2 túi lớn khăn giấy tre TISSUEPack",
          "price": "80,000 đ",
          "image": "assets/pub/product.jpg",
        },
      ],
      "Khăn giặt": [],
    };

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
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
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: categories.keys.map((category) {
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
        body: TabBarView(
          children: categories.entries.map((entry) {
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
                  childAspectRatio: 0.65,
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
                                child: Image.asset(
                                  product["image"]!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product["title"]!,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product["price"]!,
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
        ),
      ),
    );
  }
}