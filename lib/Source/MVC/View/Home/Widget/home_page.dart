import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/Res/res_insert.dart';
import '../../Post/post_screen.dart';
import 'home_best_seller_section.dart';
import 'home_category_section.dart';
import 'home_combo_suggestion_section.dart';
import 'home_header.dart';
import 'home_quick_actions.dart';
import 'home_search_bar.dart';
import 'home_slider.dart';
import 'home_voucher_section.dart';

class HomeController extends GetxController {
  var navigated = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 50 && !navigated.value) {
      navigated.value = true;

      Future.delayed(const Duration(milliseconds: 300), () {
        Get.to(() => const PostScreen())?.then((_) {
          navigated.value = false; // Reset khi quay về
        });
      });
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController()); // Ensure HomeController is created

    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (_) => true,
        child: SingleChildScrollView(
          controller: homeController.scrollController, // Now scrollController is correctly used
          child: Column(
            children: [
              const HomeHeader(),
              const HomeSlider(),
              const HomeSearchBar(),
              const HomeMenuShortcut(),
              const HomeVoucherSlider(),
              const HomeBestSeller(),
              const HomeCategorySection(),
              const HomeComboSuggestionSection(),
              ResInset.g20,
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tiếp tục vuốt lên để đọc",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset("assets/pub/ttt.png"),
                ],
              ),
              ResInset.g32,
            ],
          ),
        ),
      ),
    );
  }
}

