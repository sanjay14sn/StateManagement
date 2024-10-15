import 'package:flutter/material.dart';
import 'package:untitled6/carousel/carousel.dart';
import 'package:untitled6/comp/bottom_nav.dart';
import 'package:untitled6/comp/cart_page.dart';
import 'package:untitled6/const.dart';
import 'package:untitled6/login/signup/login.dart';
import 'package:untitled6/models/Homeappbar.dart'; // Ensure this path is correct
import 'package:untitled6/shop_page.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: HomeAppBar(), // Correct usage of 'HomeAppBar'
      ),
      bottomNavigationBar: bottomnav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }

  // List of pages for navigation
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const Loginpage(),
  ];
}
