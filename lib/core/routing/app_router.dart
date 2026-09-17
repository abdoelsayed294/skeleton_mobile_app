import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/widgets/main_navigation_screen.dart';
import 'package:skeleton_mobile_app/features/home/ui/scereens/home_screan.dart';
import 'package:skeleton_mobile_app/features/home/ui/scereens/today_sales_screen.dart';
import 'package:skeleton_mobile_app/features/home/ui/scereens/profit_details_screen.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/scereens/product_details_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/profile_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/edit_profile_screan.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/scereens/purchases_screan.dart';
import 'package:skeleton_mobile_app/features/reports/ui/scereens/reports_screan.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/screens/notifications_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.appStartScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Hello World!'))),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());

      case Routes.inventoryScreen:
        return MaterialPageRoute(builder: (_) => const InventoryScrean());
      case Routes.reportsScreen:
        return MaterialPageRoute(builder: (_) => const ReportsScrean());
      case Routes.todaySalesScreen:
        return MaterialPageRoute(builder: (_) => const TodaySalesScreen());
      case Routes.profitDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProfitDetailsScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScrean());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScrean());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScrean());
      case Routes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScrean());
      case Routes.purchasesScreen:
        return MaterialPageRoute(builder: (_) => const PurchasesScrean());
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
