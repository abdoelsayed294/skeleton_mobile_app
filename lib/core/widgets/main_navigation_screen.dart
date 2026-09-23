import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/di/injectoin.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/widgets/animated_navbar/animated_navbar.dart';
import 'package:skeleton_mobile_app/core/widgets/animated_navbar/navbar_item.dart';
import 'package:skeleton_mobile_app/features/home/ui/screens/home_screan.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/reports/ui/scereens/reports_screan.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  late List<bool> _initializedTabs;

  @override
  void initState() {
    super.initState();
    _initializedTabs = List.generate(_screens.length, (index) => index == 0);
  }

  static final _screens = [
    const HomeScrean(),
    const ReportsScrean(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<InventoryCubit>()..getInventorySummary(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<InventoryProductCubit>()..getInventoryProducts(),
        ),
      ],
      child: const InventoryScrean(),
    ),
  ];

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
      body: IndexedStack(
        index: _currentIndex,
        children: List.generate(_screens.length, (index) {
          return _initializedTabs[index] ? _screens[index] : const SizedBox.shrink();
        }),
      ),
      bottomNavigationBar: AnimatedSpotlightNavbar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _initializedTabs[index] = true;
          });
        },
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
