import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Card/card_screen.dart';
import 'package:tryhard/Source/MVC/View/Order/order_list_screen.dart';
import 'package:tryhard/Source/MVC/View/Product/product_page.dart';
import 'package:tryhard/Source/MVC/View/Profile/profile_screen.dart';
import 'BottomNavBar/bottom_nav_controller.dart';
import 'BottomNavBar/custom_bottom_navbar.dart';
import 'Widget/home_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
     HomeContent(),
     ProductPage(),
    CartPage(),
    OrderListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      body: pages[controller.currentIndex.value],
      bottomNavigationBar: const CustomBottomNavBar(),
    ));
  }
}
