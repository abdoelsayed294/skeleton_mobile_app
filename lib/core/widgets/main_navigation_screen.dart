import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/widgets/animated_navbar/animated_navbar.dart';
import 'package:skeleton_mobile_app/core/widgets/animated_navbar/navbar_item.dart';
import 'package:skeleton_mobile_app/features/home/ui/screens/home_screan.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/reports/ui/scereens/reports_screan.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  static const _screens = [HomeScrean(), ReportsScrean(), InventoryScrean()];

  static const _navItems = [
    AnimatedNavbarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_rounded),
    ),
    AnimatedNavbarItem(
      icon: Icon(Icons.bar_chart_outlined),
      activeIcon: Icon(Icons.bar_chart_rounded),
    ),
    AnimatedNavbarItem(
      icon: Icon(Icons.inventory_2_outlined),
      activeIcon: Icon(Icons.inventory_2_rounded),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: AnimatedSpotlightNavbar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: isDark
            ? AppColorsDark.surface
            : AppColorsLight.surface,
        activeColor: isDark ? AppColorsDark.primary : AppColorsLight.primary,
        inactiveColor: isDark
            ? AppColorsDark.textMuted
            : AppColorsLight.textMuted,
      ),
    );
  }
}
