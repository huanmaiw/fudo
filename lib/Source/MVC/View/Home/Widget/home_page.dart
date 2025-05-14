import 'package:flutter/material.dart';
import 'package:tryhard/Core/Res/res_insert.dart';
import 'package:tryhard/Source/MVC/View/Post/post_screen.dart';
import 'home_best_seller_section.dart';
import 'home_category_section.dart';
import 'home_combo_suggestion_section.dart';
import 'home_header.dart';
import 'home_quick_actions.dart';
import 'home_search_bar.dart';
import 'home_slider.dart';
import 'home_voucher_section.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final ScrollController _scrollController = ScrollController();
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 50 &&
        !_navigated) {
      _navigated = true;

      // Delay để scroll xong đã
      Future.delayed(const Duration(milliseconds: 300), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PostScreen()), // màn tiếp theo
        ).then((_) {
          _navigated = false; // reset khi quay về
        });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (_) => true,
        child: SingleChildScrollView(
          controller: _scrollController,
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
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tiếp tục vuốt lên để đọc",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
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
