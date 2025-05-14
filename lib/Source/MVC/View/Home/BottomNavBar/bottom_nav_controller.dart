// lib/modules/main/controller/bottom_nav_controller.dart
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  var cartItemCount = 3.obs; // giả lập số lượng sản phẩm

  void changeTab(int index) {
    currentIndex.value = index;
  }

  // Giả sử sau này gọi API để lấy số lượng giỏ hàng
  void updateCartCount(int count) {
    cartItemCount.value = count;
  }
}
