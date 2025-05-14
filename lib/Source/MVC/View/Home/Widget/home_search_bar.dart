import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_screen.dart';
import 'search_screen.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Ô tìm kiếm với background xám
          Expanded(
            child: GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen())),
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      "Tìm sản phẩm",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Icon chat
          GestureDetector(
            onTap: ()=> Get.snackbar(
              "Thông báo",
              "Chức năng này đang được phát triển",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            ),
            child: Image.asset(
              "assets/pub/chat-oa.png",
              height: 44,
              width: 44,
            ),
          ),
          const SizedBox(width: 12),
          // Icon notification
          GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen())),
            child: Image.asset(
              "assets/pub/noti.png",
              height: 44,
              width: 44,
            ),
          ),
        ],
      ),
    );
  }
}
