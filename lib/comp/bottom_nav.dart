import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnav extends StatelessWidget {
  final void Function(int)? onTabChange;

  const bottomnav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.5),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[600],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
          GButton(icon: Icons.login,
          text:'Login',)
        ],
      ),
    );
  }
}