import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/home_page.dart';

import '../../Source/MVC/View/Home/bottomnavbar.dart';
import 'bindings.dart';

class Routers{
  static const String home = '/home';
}
class GetPages{
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

  ];

}