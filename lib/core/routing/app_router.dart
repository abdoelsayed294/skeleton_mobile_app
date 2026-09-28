import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/di/injectoin.dart';
import 'package:skeleton_mobile_app/core/widgets/main_navigation_screen.dart';
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart';
import 'package:skeleton_mobile_app/features/home/ui/screens/home_screan.dart';
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_export_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_month_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_date_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/screens/today_sales_screen.dart';
import 'package:skeleton_mobile_app/features/today_sales/ui/screens/today_recent_transactions_screen.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/screens/profit_details_screen.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_weekly_chart_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/scereens/inventory_screan.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/scereens/product_details_screan.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_activity_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_pricing_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_sales_history_cubit.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/profile_screan.dart';
import 'package:skeleton_mobile_app/features/profile/ui/scereens/edit_profile_screan.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/scereens/purchases_screan.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/scereens/purchases_recent_transactions_screen.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_date_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/ui/screens/reports_screan.dart';
import 'package:skeleton_mobile_app/features/reports/ui/screens/reports_recent_transactions_screen.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/screens/notifications_screen.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/screens/expenses_screen.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_by_category_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_date_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_monthly_trend_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_peak_days_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_transactions_cubit.dart';
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_cubit.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/screens/scan_qr_screen.dart';
import 'package:skeleton_mobile_app/features/scan_qr/ui/screens/qr_scanner_screen.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branches_cubit.dart';
import 'package:skeleton_mobile_app/features/branch_selection/logic/branch_selection_cubit.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/screens/branch_selection_screen.dart';
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
      case Routes.branchSelectionScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<BranchesCubit>()..getBranches(),
              ),
              BlocProvider(create: (_) => getIt<BranchSelectionCubit>()),
            ],
            child: const BranchSelectionScreen(),
          ),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(create: (_) => getIt<ReportsSalesCubit>()),
              BlocProvider(create: (_) => getIt<TopSellingCubit>()),
              BlocProvider(create: (_) => getIt<RecentTransactionCubit>()),
              BlocProvider(
                create: (context) => ReportsMonthCubit(
                  context.read<ReportsSalesCubit>(),
                  context.read<TopSellingCubit>(),
                  context.read<RecentTransactionCubit>(),
                  DateTime.now(),
                ),
              ),
              BlocProvider(create: (context) => getIt<ReportsExportCubit>()),
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
              BlocProvider(
                create: (context) => ReportsMonthCubit(
                  context.read<ReportsSalesCubit>(),
                  context.read<TopSellingCubit>(),
                  context.read<RecentTransactionCubit>(),
                  DateTime.now(),
                ),
              ),
              BlocProvider(create: (_) => getIt<ReportsExportCubit>()),
            ],
            child: const ReportsScrean(),
          ),
        );
      case Routes.todaySalesScreen:
        final date = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<TodaySalesCubit>()),
                BlocProvider(
                  create: (_) => getIt<TodayRecentTransactionCubit>(),
                ),
                BlocProvider(
                  create: (context) => TodaySalesDateCubit(
                    context.read<TodaySalesCubit>(),
                    context.read<TodayRecentTransactionCubit>(),
                    date,
                  ),
                ),
              ],
              child: const TodaySalesScreen(),
            );
          },
        );
      case Routes.todayRecentTransactionsScreen:
        final date = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                getIt<TodayRecentTransactionCubit>()
                  ..getRecentTransactions(date: date, take: 20, all: false),
            child: const TodayRecentTransactionsScreen(),
          ),
        );
      case Routes.reportsRecentTransactionsScreen:
        final month = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RecentTransactionCubit>()
              ..getRecentTransactions(
                take: 20,
                year: month.year,
                month: month.month,
              ),
            child: const ReportsRecentTransactionsScreen(),
          ),
        );
      case Routes.profitDetailsScreen:
        final date = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<ProfitSummaryCubit>()..selectDate(date),
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
        final productId = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt<ProductActivityCubit>()
                      ..getProductActivity(productId),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<ProductHeaderCubit>()..getProductHeader(productId),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<ProductPricingCubit>()..getProductPricing(productId),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<ProductInventoryCubit>()
                      ..getProductInventory(productId),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<ProductSalesHistoryCubit>()
                      ..getProductSalesHistory(productId),
              ),
            ],
            child: ProductDetailsScrean(productId: productId),
          ),
        );
      case Routes.purchasesScreen:
        final selectedDate = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getIt<PurchasesSummaryCubit>()),
                BlocProvider(create: (_) => getIt<PurchasesRecentCubit>()),
                BlocProvider(
                  create: (context) => PurchasesDateCubit(
                    context.read<PurchasesSummaryCubit>(),
                    context.read<PurchasesRecentCubit>(),
                    selectedDate,
                  ),
                ),
              ],
              child: const PurchasesScrean(),
            );
          },
        );
      case Routes.purchasesRecentTransactionsScreen:
        final date = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                getIt<PurchasesRecentCubit>()..getPurchasesRecent(date),
            child: const PurchasesRecentTransactionsScreen(),
          ),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case Routes.expensesScreen:
        final selectedDate = settings.arguments as DateTime? ?? DateTime.now();
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<ExpensesSummaryCubit>()),
              BlocProvider(create: (_) => getIt<ExpensesMonthlyTrendCubit>()),
              BlocProvider(create: (_) => getIt<ExpensesByCategoryCubit>()),
              BlocProvider(create: (_) => getIt<ExpensesPeakDaysCubit>()),
              BlocProvider(create: (_) => getIt<ExpensesTransactionsCubit>()),
              BlocProvider(
                create: (context) => ExpensesDateCubit(
                  context.read<ExpensesSummaryCubit>(),
                  context.read<ExpensesMonthlyTrendCubit>(),
                  context.read<ExpensesByCategoryCubit>(),
                  context.read<ExpensesPeakDaysCubit>(),
                  context.read<ExpensesTransactionsCubit>(),
                  initialDate: selectedDate,
                )..loadInitial(),
              ),
            ],
            child: const ExpensesScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
