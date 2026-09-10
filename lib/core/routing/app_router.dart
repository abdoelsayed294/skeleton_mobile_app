import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/features/home/ui/scereens/home_screan.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/profile_screan.dart';
import 'package:skeleton_mobile_app/features/reports/ui/scereens/reports_screan.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.appStartScreen:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Hello World!')),
          ),
        );
        
      case Routes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => const InventoryScrean(),
        );
      case Routes.reportsScreen:
        return MaterialPageRoute(
          builder: (_) => const ReportsScrean(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScrean(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScrean(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
