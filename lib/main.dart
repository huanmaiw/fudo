import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/App/bindings.dart';
import 'Source/MVC/View/Home/BottomNavBar/bottom_nav_controller.dart';
import 'Source/MVC/View/Home/bottomnavbar.dart';
import 'Source/MVC/View/Order/order_controller.dart';
import 'Source/MVC/View/Product/product_controller.dart';



void main() {
  Get.put(BottomNavController());
  Get.put(OrderController());
  Get.put(ProductController());
  runApp(
    DevicePreview(builder: (context) => const MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(), // Sử dụng MainBinding
      home: HomePage(),
      getPages: [
        GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
        // Thêm các route khác nếu cần
      ],
    );
  }
}