import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fundora/core/managers/color_manager.dart';
import 'package:fundora/core/managers/image_manager.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  static final List<_NavItem> _navItems = [
    _NavItem(icon: ImageManager.home, label: "Home"),
    _NavItem(icon: ImageManager.allocate, label: "Allocate"),
    _NavItem(icon: ImageManager.categories, label: "Categories"),
    _NavItem(icon: ImageManager.history, label: "History"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedLabelStyle: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: AppColors.primary,
        items: _navItems
            .map(
              (e) => BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greenFill,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    e.icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  e.icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
                label: e.label,
              ),
            )
            .toList(),
        type: BottomNavigationBarType.fixed,
        onTap: _goBranch,
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavItem {
  final String label;
  final String icon;

  new({required this.label, required this.icon});
}
