// views/home_header.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'icon_with_background.dart';
import 'mvc/home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController1());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/pub/logo.png"),
              const Spacer(),
              const IconWithBackground(icon: Icons.more_horiz),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () => homeController.closePage(), // Sử dụng GetX để xử lý đóng trang
                child: const IconWithBackground(icon: Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() {
            return Text(
              'Xin chào, ${homeController.user.value.name}!', // Lấy tên người dùng từ controller
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          }),
          const Text(
            'Hôm nay bạn muốn đặt giấy nào?',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
