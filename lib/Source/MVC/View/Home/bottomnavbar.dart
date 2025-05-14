import 'package:flutter/material.dart';
import 'package:tryhard/Source/MVC/View/Card/card_screen.dart';
import 'package:tryhard/Source/MVC/View/Order/order_list_screen.dart';
import 'package:tryhard/Source/MVC/View/Product/product_page.dart';
import 'package:tryhard/Source/MVC/View/Profile/profile_screen.dart';
import 'BottomNavBar/custom_bottom_navbar.dart';
import 'Widget/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int cartItemCount = 3;

  final List<Widget> _pages = [
    const HomeContent(),
    const ProductPage(),
    CartPage(),
    OrderListPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        cartItemCount: cartItemCount,
      ),
    );
  }
}
