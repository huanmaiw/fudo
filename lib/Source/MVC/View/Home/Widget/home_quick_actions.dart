import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Home/Widget/voucher.dart';
import 'package:tryhard/Source/MVC/View/Post/post_screen.dart';

class HomeMenuShortcut extends StatelessWidget {
  const HomeMenuShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen())),
              child: Image.asset("assets/short_cut/sc.png")),
          GestureDetector(
            onTap: ()=>
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Voucher())),
              child: Image.asset("assets/short_cut/sc2.png")),
          GestureDetector(
            onTap: ()=>Get.snackbar("Thông báo", "Chức năng đang phát triển",
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
                snackPosition: SnackPosition.TOP,
              
            ),
              child: Image.asset("assets/short_cut/sc3.png")),
        ],
      ),
    );
  }
}
