import 'package:discover/core/utils/app_assets.dart';
import 'package:discover/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondary,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            AppAssets.imagesIconHome,
            width: 24,
            color:
                widget.selectedIndex == 0
                    ? AppColors.primary
                    : AppColors.secondary,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppAssets.imagesIconCart,
            width: 24,
            color:
                widget.selectedIndex == 1
                    ? AppColors.primary
                    : AppColors.secondary,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppAssets.imagesIconUser,
            width: 24,
            color:
                widget.selectedIndex == 2
                    ? AppColors.primary
                    : AppColors.secondary,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
