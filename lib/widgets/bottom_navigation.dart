import 'package:coffee_app/screen/home_screen/home_page.dart';
import 'package:coffee_app/screen/orders_page/orders_page.dart';
import 'package:coffee_app/screen/products/products.dart';
import 'package:coffee_app/screen/profile/profile_page.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final GlobalKey<CurvedNavigationBarState> _curvedNavigationKey = GlobalKey();
  int _pageIndex = 0;

  final List<Widget> _pages = [
    HomePage(), // صفحه اصلی
    Products(), // صفحه محصولات
    OrdersPage(), // صفحه سبد خرید
    ProfilePage(), // صفحه پروفایل
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvedNavigationKey,
        index: _pageIndex,
        height: 60,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.coffee, size: 30, color: Colors.black),
          Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.black),
          Icon(Icons.person, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        color: brownColor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        letIndexChange: (index) => true,
      ),
    );
  }
}