import 'package:get/get.dart';

import '../../Source/MVC/View/Home/BottomNavBar/bottom_nav_controller.dart';
import '../../Source/MVC/View/Home/Widget/home_page.dart';
import '../../Source/MVC/View/Home/Widget/mvc/product_controller.dart';
import '../../Source/MVC/View/Order/order_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Không khởi tạo HomeController ở đây
  }
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Có thể thêm các controller khác nếu cần
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProductController1());
    Get.put(BottomNavController());
    Get.put(OrderController());

  }
}