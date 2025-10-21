import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test2_app/core/constants/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.onTabChange,
    super.key,
  });
  final ValueChanged<int> onTabChange;
  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) {
        onTabChange(value);
      },

      tabMargin: const EdgeInsets.all(8),
      tabBorderRadius: 50,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      gap: 8,
      color: AppColors.kGreyColor,
      activeColor: AppColors.kWhiteColor,
      iconSize: 24,
      tabBackgroundColor: AppColors.kPrimaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      backgroundColor: AppColors.kWhiteColor,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.store,
          text: 'cart',
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Favorites',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}
