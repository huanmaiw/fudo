import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'post_controller.dart';
import 'post_item_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller
    final PostController controller = Get.put(PostController());

    // Load dữ liệu bài viết
    controller.loadPosts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/icon/back.png", width: 40, height: 40),
            ),
            const Text("Bài viết", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.close, color: Colors.black),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh banner
            Image.asset('assets/pub/post.jpg'),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MỚI NHẤT",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Ra mắt sản phẩm khăn giấy hộp TISSUEBox tiện lợi",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Khăn giấy khô Fudo Tissue là sản phẩm khăn giấy cao cấp...",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
            // Sử dụng Obx để theo dõi sự thay đổi của danh sách bài viết
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: PostItemCard(post: controller.posts[0])),
                    SizedBox(width: 12),
                    Expanded(child: PostItemCard(post: controller.posts[1])),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
