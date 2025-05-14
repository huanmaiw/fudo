import 'package:get/get.dart';
import 'post_model.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;

  // Fake dữ liệu bài viết
  void loadPosts() {
    posts.addAll([
      Post(
        title: "Ra mắt sản phẩm khăn giấy hộp TISSUEBox tiện lợi",
        content: "Khăn giấy khô Fudo Tissue là sản phẩm khăn giấy cao cấp...",
        date: "20.10.2023",
      ),
      Post(
        title: "Tại sao nên dùng khăn giấy làm từ tre?",
        content: "Khăn giấy Fudo Tissue là sản phẩm không chỉ an toàn...",
        date: "19.10.2023",
      ),
    ]);
  }
}
