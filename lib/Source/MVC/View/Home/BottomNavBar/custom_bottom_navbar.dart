import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final int cartItemCount;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.cartItemCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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
              if (cartItemCount > 0)
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
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
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
    );
  }
}
