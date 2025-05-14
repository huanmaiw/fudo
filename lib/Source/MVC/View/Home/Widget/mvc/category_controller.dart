// controllers/category_controller.dart
import 'package:get/get.dart';
import 'category_model.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[
    CategoryModel(title: "Giấy vệ sinh", image: "assets/pub/cate1.png"),
    CategoryModel(title: "Khăn giấy rút", image: "assets/pub/cate2.png"),
    CategoryModel(title: "Gói bỏ túi", image: "assets/pub/cate3.png"),
    CategoryModel(title: "Hộp để bàn", image: "assets/pub/cate4.png"),
  ].obs;


}
