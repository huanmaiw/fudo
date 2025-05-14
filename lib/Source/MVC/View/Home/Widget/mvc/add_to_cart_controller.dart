import 'package:get/get.dart';

class AddToCartController extends GetxController {
  var quantity = 1.obs;

  void increaseQty() {
    quantity.value++;
  }

  void decreaseQty() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  double calculateTotal(double price) {
    return price * quantity.value;
  }
}
