import 'package:flutter/material.dart';

import 'profile_screen.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())),
                child: Image.asset("assets/icon/back.png", width: 40, height: 40)),
            const Text(
              'Thông tin tài khoản',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.close, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoBox(Icons.person, 'Bùi Xuân Thiện'),
            const SizedBox(height: 16),
            _buildInfoBox(Icons.phone, '0838032132'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/bt1.png',
            width: 24,
            height: 24,
          ),
          label: 'Cửa hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/bt2.png',
            width: 24,
            height: 24,
          ),
          label: 'Sản phẩm',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/icon/bt3.png',
                width: 24,
                height: 24,
              ),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                  ),
                ),
            ],
          ),
          label: 'Giỏ hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/bt4.png',
            width: 24,
            height: 24,
          ),
          label: 'Đơn hàng',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icon/bt5.png',
            width: 24,
            height: 24,
          ),
          label: 'Cá nhân',
        ),
      ],

    ));
  }

  Widget _buildInfoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
