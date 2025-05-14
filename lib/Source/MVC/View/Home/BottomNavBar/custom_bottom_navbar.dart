// lib/modules/main/widget/custom_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    return Obx(() => BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      onTap: controller.changeTab,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon/bt1.png', width: 24, height: 24),
          label: 'Cửa hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon/bt2.png', width: 24, height: 24),
          label: 'Sản phẩm',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/icon/bt3.png', width: 24, height: 24),
              if (controller.cartItemCount.value > 0)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${controller.cartItemCount.value}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          label: 'Giỏ hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon/bt4.png', width: 24, height: 24),
          label: 'Đơn hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon/bt5.png', width: 24, height: 24),
          label: 'Cá nhân',
        ),
      ],
    ));
  }
}
