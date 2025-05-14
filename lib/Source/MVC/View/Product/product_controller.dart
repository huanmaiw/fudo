import 'package:get/get.dart';
import 'product_model.dart';

class ProductController extends GetxController {
  var categories = <String, List<Product>>{}.obs;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }
  void loadProducts() {
    categories.value = {
      "Khăn giấy rút": [
        Product(
          title: "Thùng 20 gói khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
        Product(
          title: "Thùng 20 gói khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
        Product(
          title: "Túi lớn 04 gói khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
        Product(
          title: "Combo 2 túi lớn khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
      ],
      "Giấy cuộn": [
        Product(
          title: "Túi lớn 04 gói khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
      ],
      "Khăn giấy bỏ túi": [
        Product(
          title: "Combo 2 túi lớn khăn giấy tre TISSUEPack",
          price: "80,000 đ",
          image: "assets/pub/product.jpg",
        ),
      ],
      "Khăn giặt": [],
    };
  }
}
