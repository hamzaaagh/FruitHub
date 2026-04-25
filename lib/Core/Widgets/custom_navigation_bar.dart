import 'package:flutter/material.dart';
import 'package:fruit_app/Core/utils/app_colors.dart';
import 'package:fruit_app/Core/utils/app_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: GNav(
          key: ValueKey(navigationShell.currentIndex),
          haptic: true,
          tabBorderRadius: 30,
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 200),
          gap: 8,
          color: Colors.grey[600],
          activeColor: AppColors.primarycolor,
          iconSize: 26,
          tabBackgroundColor: Colors.grey[200]!.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          selectedIndex: navigationShell.currentIndex,

          textStyle: AppStyles.semiBold14.copyWith(
            color: AppColors.primarycolor,
          ),
          onTabChange: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          tabs: [
            _buildGButton(
              index: 0,
              currentIndex: navigationShell.currentIndex,
              iconOutline: Icons.home_outlined,
              iconFilled: Icons.home_rounded,
              text: 'الرئيسية',
            ),
            _buildGButton(
              index: 1,
              currentIndex: navigationShell.currentIndex,
              iconOutline: Icons.grid_view_rounded,
              iconFilled: Icons.grid_view_rounded,
              text: 'الأقسام',
            ),
            _buildGButton(
              index: 2,
              currentIndex: navigationShell.currentIndex,
              iconOutline: Icons.shopping_cart_outlined,
              iconFilled: Icons.shopping_cart_rounded,
              text: 'السلة',
            ),
            _buildGButton(
              index: 3,
              currentIndex: navigationShell.currentIndex,
              iconOutline: Icons.person_outline_rounded,
              iconFilled: Icons.person_rounded,
              text: 'الملف',
            ),
          ],
        ),
      ),
    );
  }

  GButton _buildGButton({
    required int index,
    required int currentIndex,
    required IconData iconOutline,
    required IconData iconFilled,
    required String text,
  }) {
    final bool isActive = index == currentIndex;

    return GButton(
      icon: iconOutline,
      text: text,
      leading: isActive
          ? Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.primarycolor,
                shape: BoxShape.circle,
              ),
              child: Icon(iconFilled, color: Colors.white, size: 20),
            )
          : null,
    );
  }
}
