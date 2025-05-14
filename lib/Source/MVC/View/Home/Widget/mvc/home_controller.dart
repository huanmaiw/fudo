// controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/mvc/user_model.dart';

class HomeController1 extends GetxController {
  var user = UserModel(name: 'Thiện').obs;

  void closePage() {

    Get.back();
  }
}
