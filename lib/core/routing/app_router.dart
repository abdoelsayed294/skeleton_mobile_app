import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/di/injectoin.dart';
import 'package:skeleton_mobile_app/core/widgets/main_navigation_screen.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/ui/screens/home_screan.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/screens/today_sales_screen.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/screens/profit_details_screen.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_weekly_chart_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/scereens/product_details_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/profile_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/edit_profile_screan.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/scereens/purchases_screan.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/ui/scereens/reports_screan.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/screens/notifications_screen.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_cubit.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/screens/scan_qr_screen.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/screens/qr_scanner_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.appStartScreen:
        return MaterialPageRoute(builder: (_) => const ScanQrScreen());
      case Routes.scanQrScreen:
        return MaterialPageRoute(builder: (_) => const ScanQrScreen());
      case Routes.qrScannerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<QrCubit>(),
            child: const QrScannerScreen(),
          ),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(create: (context) => getIt<ReportsSalesCubit>()),
              BlocProvider(create: (context) => getIt<TopSellingCubit>()),
              BlocProvider(
                create: (context) => getIt<RecentTransactionCubit>(),
              ),
            ],
            child: const MainNavigationScreen(),
          ),
        );

      case Routes.inventoryScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
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
        );
      case Routes.reportsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<ReportsSalesCubit>()),
              BlocProvider(create: (_) => getIt<TopSellingCubit>()),
              BlocProvider(create: (_) => getIt<RecentTransactionCubit>()),
            ],
            child: const ReportsScrean(),
          ),
        );
      case Routes.todaySalesScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<TodaySalesCubit>()),
              BlocProvider(create: (_) => getIt<TodayRecentTransactionCubit>()),
            ],
            child: const TodaySalesScreen(),
          ),
        );
      case Routes.profitDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt<ProfitSummaryCubit>()..getProfitSummary('today'),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<ProfitWeeklyChartCubit>()..getProfitWeeklyChart(),
              ),
            ],
            child: const ProfitDetailsScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScrean());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScrean());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: const HomeScrean(),
          ),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScrean());
      case Routes.purchasesScreen:
        return MaterialPageRoute(
          builder: (_) {
            final now = DateTime.now();
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      getIt<PurchasesSummaryCubit>()
                        ..getPurchasesSummary(now.year, now.month),
                ),
                BlocProvider(
                  create: (_) =>
                      getIt<PurchasesRecentCubit>()
                        ..getPurchasesRecent(now.year, now.month),
                ),
              ],
              child: const PurchasesScrean(),
            );
          },
        );
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
