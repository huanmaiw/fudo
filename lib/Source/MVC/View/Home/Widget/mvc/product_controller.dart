// controllers/product_controller.dart
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/mvc/product_model.dart';

class ProductController1 extends GetxController {
  var product = ProductModel(
    title: 'Thùng 20 gói khăn giấy tre TISSUEPack',
    image: 'assets/pub/hot1.jpg',
    price: 165000,
    isCombo: false,
  ).obs;

  void updateProduct(ProductModel newProduct) {
    product.value = newProduct;
  }

// Add any logic related to product actions like adding to cart or updating quantity
}
