import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: ()=>Navigator.pop(context),
                child: Image.asset("assets/icon/back.png", width: 40, height: 40)),
            const Text("Bài viết",
                style: TextStyle(color: Colors.black, fontSize: 30,
                    fontWeight: FontWeight.bold)),

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
            Image.asset('assets/pub/post.jpg'), // thay bằng ảnh của bạn
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
                    "Khăn giấy khô Fudo Tissue là sản phẩm khăn giấy cao cấp được sản xuất từ tre tự nhiên, an toàn cho người sử dụng và thân thiện với môi trường.",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: PostItemCard()),
                  SizedBox(width: 12),
                  Expanded(child: PostItemCard()),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class PostItemCard extends StatelessWidget {
  const PostItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("BÀI VIẾT", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text(
          "Tại sao nên dùng khăn giấy làm từ tre?",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "20.10.2023",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
