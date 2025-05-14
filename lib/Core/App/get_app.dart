import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tryhard/Core/App/theme_app.dart';

import 'bindings.dart';
import 'get_pages.dart';

class GetApp extends StatelessWidget {
  const GetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lunar Calendar Event',
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.home,
      defaultTransition: Transition.cupertino,
      getPages: GetPages.pages,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
      popGesture: true,
      initialBinding: AppBindings(),
    );
  }
}
