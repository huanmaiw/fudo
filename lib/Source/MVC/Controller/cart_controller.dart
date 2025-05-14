// lib/modules/cart/controller/cart_controller.dart
import 'package:get/get.dart';

import '../temp_model/cart_item_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItemModel>[].obs;
  var isChecked = <bool>[].obs;
  var quantities = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fake data init
    cartItems.addAll([
      CartItemModel(
        title: "TISSUEPack - Khăn giấy rút tre siêu thấm",
        variant: "Thùng 20 gói",
        variantOptions: ["Phân loại 2", "Phân loại 3"],
        price: 380000,
        image: "assets/pub/card1.jpg",
      ),
      CartItemModel(
        title: "TISSUEPack - Khăn giấy rút tre siêu thấm",
        variant: "Túi lớn 04 gói",
        variantOptions: ["Phân loại 2", "Phân loại 3"],
        price: 80000,
        image: "assets/pub/card2.png",
      ),
      CartItemModel(
        title: "TISSUEPocket - Khăn giấy bỏ túi tiện lợi",
        variant: "Lốc 12 gói",
        variantOptions: ["Phân loại 2", "Phân loại 3"],
        price: 45000,
        image: "assets/pub/card3.png",
      ),
    ]);

    isChecked.assignAll(List.generate(cartItems.length, (_) => true));
    quantities.assignAll(List.generate(cartItems.length, (_) => 1));
  }

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      if (isChecked[i]) {
        total += cartItems[i].price * quantities[i];
      }
    }
    return total;
  }

  void toggleAll(bool? value) {
    isChecked.assignAll(List.generate(cartItems.length, (_) => value ?? false));
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    isChecked.removeAt(index);
    quantities.removeAt(index);
  }

  void increaseQty(int index) => quantities[index]++;
  void decreaseQty(int index) {
    if (quantities[index] > 1) quantities[index]--;
  }
}
