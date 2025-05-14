import 'package:flutter/material.dart';
import 'package:tryhard/Source/MVC/View/Home/bottomnavbar.dart';

import 'icon_with_background.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/pub/logo.png"),
              const Spacer(),
              const IconWithBackground(icon: Icons.more_horiz),
              SizedBox(width: 8),
              GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage())),
                  child: const IconWithBackground(icon: Icons.close)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Xin chào, Thiện!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Hôm nay bạn muốn đặt giấy nào?',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
