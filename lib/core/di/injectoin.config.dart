// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:skeleton_mobile_app/core/networking/api_service.dart' as _i35;
import 'package:skeleton_mobile_app/core/networking/dio_module.dart' as _i453;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/low_stock_remote_data_source.dart'
    as _i948;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/low_stock_remote_data_source_impl.dart'
    as _i216;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/sales_chart_remote_data_source.dart'
    as _i878;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/sales_chart_remote_data_source_impl.dart'
    as _i500;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/summary_remote_data_source.dart'
    as _i1001;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/summary_remote_data_source_impl.dart'
    as _i460;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/top_products_remote_data_source.dart'
    as _i737;
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/top_products_remote_data_source_impl.dart'
    as _i169;
import 'package:skeleton_mobile_app/features/home/data/repo/home_repo_impl.dart'
    as _i101;
import 'package:skeleton_mobile_app/features/home/domain/repo/home_repo.dart'
    as _i281;
import 'package:skeleton_mobile_app/features/home/domain/use_cases/low_stock_use_case.dart'
    as _i290;
import 'package:skeleton_mobile_app/features/home/domain/use_cases/sales_chart_use_case.dart'
    as _i1055;
import 'package:skeleton_mobile_app/features/home/domain/use_cases/summary_use_case.dart'
    as _i267;
import 'package:skeleton_mobile_app/features/home/domain/use_cases/top_products_use_case.dart'
    as _i134;
import 'package:skeleton_mobile_app/features/home/logic/home_cubit.dart'
    as _i1007;
import 'package:skeleton_mobile_app/features/inventory/data/data_sources/remote/inventory_summary_remote_data_sources.dart'
    as _i1051;
import 'package:skeleton_mobile_app/features/inventory/data/data_sources/remote/inventory_summary_remote_data_sources_impl.dart'
    as _i344;
import 'package:skeleton_mobile_app/features/inventory/data/repo/inventory_summary_repo_impl.dart'
    as _i623;
import 'package:skeleton_mobile_app/features/inventory/domain/repo/inventory_summary_repo.dart'
    as _i3;
import 'package:skeleton_mobile_app/features/inventory/domain/use_cases/Inventory_proudct_use_case.dart'
    as _i293;
import 'package:skeleton_mobile_app/features/inventory/domain/use_cases/inventory_summary_use_case.dart'
    as _i479;
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart'
    as _i956;
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart'
    as _i579;
import 'package:skeleton_mobile_app/features/product_details/data/data_sources/remote/product_details_remote_data_source.dart'
    as _i319;
import 'package:skeleton_mobile_app/features/product_details/data/data_sources/remote/product_details_remote_data_source_impl.dart'
    as _i302;
import 'package:skeleton_mobile_app/features/product_details/data/repo/product_details_repo_impl.dart'
    as _i1024;
import 'package:skeleton_mobile_app/features/product_details/domain/repo/product_details_repo.dart'
    as _i385;
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_activity_use_case.dart'
    as _i987;
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_header_use_case.dart'
    as _i751;
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_inventory_use_case.dart'
    as _i286;
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_pricing_use_case.dart'
    as _i1048;
import 'package:skeleton_mobile_app/features/product_details/domain/use_cases/get_product_sales_history_use_case.dart'
    as _i784;
import 'package:skeleton_mobile_app/features/product_details/logic/product_activity_cubit.dart'
    as _i996;
import 'package:skeleton_mobile_app/features/product_details/logic/product_header_cubit.dart'
    as _i480;
import 'package:skeleton_mobile_app/features/product_details/logic/product_inventory_cubit.dart'
    as _i88;
import 'package:skeleton_mobile_app/features/product_details/logic/product_pricing_cubit.dart'
    as _i896;
import 'package:skeleton_mobile_app/features/product_details/logic/product_sales_history_cubit.dart'
    as _i753;
import 'package:skeleton_mobile_app/features/profit_details/data/data_sources/remote/profit_remote_data_source.dart'
    as _i721;
import 'package:skeleton_mobile_app/features/profit_details/data/data_sources/remote/profit_remote_data_source_impl.dart'
    as _i970;
import 'package:skeleton_mobile_app/features/profit_details/data/repo/profit_repo_impl.dart'
    as _i218;
import 'package:skeleton_mobile_app/features/profit_details/domain/repo/profit_repo.dart'
    as _i696;
import 'package:skeleton_mobile_app/features/profit_details/domain/use_cases/get_profit_summary_use_case.dart'
    as _i519;
import 'package:skeleton_mobile_app/features/profit_details/domain/use_cases/get_profit_weekly_chart_use_case.dart'
    as _i473;
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_summary_cubit.dart'
    as _i211;
import 'package:skeleton_mobile_app/features/profit_details/logic/profit_weekly_chart_cubit.dart'
    as _i429;
import 'package:skeleton_mobile_app/features/purchases/data/data_sources/remote/purchases_remote_data_source.dart'
    as _i215;
import 'package:skeleton_mobile_app/features/purchases/data/data_sources/remote/purchases_remote_data_source_impl.dart'
    as _i433;
import 'package:skeleton_mobile_app/features/purchases/data/repo/purchases_repo_impl.dart'
    as _i1021;
import 'package:skeleton_mobile_app/features/purchases/domain/repo/purchases_repo.dart'
    as _i591;
import 'package:skeleton_mobile_app/features/purchases/domain/use_cases/get_purchases_recent_use_case.dart'
    as _i813;
import 'package:skeleton_mobile_app/features/purchases/domain/use_cases/get_purchases_summary_use_case.dart'
    as _i1023;
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart'
    as _i58;
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart'
    as _i401;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source.dart'
    as _i404;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source_impl.dart'
    as _i724;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_export_remote_data_source.dart'
    as _i38;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_export_remote_data_source_impl.dart'
    as _i57;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source.dart'
    as _i231;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source_impl.dart'
    as _i324;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source.dart'
    as _i400;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source_impl.dart'
    as _i131;
import 'package:skeleton_mobile_app/features/reports/data/repo/reports_export_repository_impl.dart'
    as _i675;
import 'package:skeleton_mobile_app/features/reports/data/repo/reports_repo_impl.dart'
    as _i298;
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_export_repository.dart'
    as _i578;
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart'
    as _i795;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/export_sales_report_use_case.dart'
    as _i629;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/recent_transaction_use_case.dart'
    as _i489;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/reports_sales_use_case.dart'
    as _i690;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/top_selling_use_case.dart'
    as _i203;
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart'
    as _i288;
import 'package:skeleton_mobile_app/features/reports/logic/reports_export_cubit.dart'
    as _i714;
import 'package:skeleton_mobile_app/features/reports/logic/reports_sales_cubit.dart'
    as _i411;
import 'package:skeleton_mobile_app/features/reports/logic/top_selling_cubit.dart'
    as _i619;
import 'package:skeleton_mobile_app/features/scan_qr/data/data_sources/remote/qr_remote_data_sources.dart'
    as _i743;
import 'package:skeleton_mobile_app/features/scan_qr/data/data_sources/remote/qr_remote_data_sources_impl.dart'
    as _i598;
import 'package:skeleton_mobile_app/features/scan_qr/data/repo/qr_repo_impl.dart'
    as _i149;
import 'package:skeleton_mobile_app/features/scan_qr/domain/repo/qr_repo.dart'
    as _i571;
import 'package:skeleton_mobile_app/features/scan_qr/domain/use_cases/qr_use_case.dart'
    as _i528;
import 'package:skeleton_mobile_app/features/scan_qr/domain/use_cases/save_qr_data_use_case.dart'
    as _i295;
import 'package:skeleton_mobile_app/features/scan_qr/logic/qr_cubit.dart'
    as _i438;
import 'package:skeleton_mobile_app/features/today_sales/data/data_source/remote/today_sales_remote_data_source.dart'
    as _i29;
import 'package:skeleton_mobile_app/features/today_sales/data/data_source/remote/today_sales_remote_data_source_impl.dart'
    as _i241;
import 'package:skeleton_mobile_app/features/today_sales/data/repo/today_sales_repo_impl.dart'
    as _i835;
import 'package:skeleton_mobile_app/features/today_sales/domain/repo/today_sales_repo.dart'
    as _i450;
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_recent_transaction_use_case.dart'
    as _i911;
import 'package:skeleton_mobile_app/features/today_sales/domain/use_cases/get_today_sales_use_case.dart'
    as _i331;
import 'package:skeleton_mobile_app/features/today_sales/logic/today_recent_transaction_cubit.dart'
    as _i512;
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_cubit.dart'
    as _i389;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i295.SaveQrDataUseCase>(() => _i295.SaveQrDataUseCase());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i38.ReportsExportRemoteDataSource>(
      () => _i57.ReportsExportRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i35.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i578.ReportsExportRepository>(
      () => _i675.ReportsExportRepositoryImpl(
        gh<_i38.ReportsExportRemoteDataSource>(),
      ),
    );
    gh.factory<_i878.SalesChartRemoteDataSource>(
      () => _i500.SalesChartRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i721.ProfitRemoteDataSource>(
      () => _i970.ProfitRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i743.QrRemoteDataSources>(
      () => _i598.QrRemoteDataSourcesImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i319.ProductDetailsRemoteDataSource>(
      () => _i302.ProductDetailsRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i696.ProfitRepo>(
      () => _i218.ProfitRepoImpl(gh<_i721.ProfitRemoteDataSource>()),
    );
    gh.factory<_i571.QrRepo>(
      () => _i149.QrRepoImpl(gh<_i743.QrRemoteDataSources>()),
    );
    gh.factory<_i215.PurchasesRemoteDataSource>(
      () => _i433.PurchasesRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i528.QrUseCase>(() => _i528.QrUseCase(gh<_i571.QrRepo>()));
    gh.factory<_i385.ProductDetailsRepo>(
      () => _i1024.ProductDetailsRepoImpl(
        gh<_i319.ProductDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i1051.InventorySummaryRemoteDataSource>(
      () => _i344.InventorySummaryRemoteDataSourcesImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i29.TodaySalesRemoteDataSource>(
      () => _i241.TodaySalesRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i987.GetProductActivityUseCase>(
      () => _i987.GetProductActivityUseCase(gh<_i385.ProductDetailsRepo>()),
    );
    gh.factory<_i751.GetProductHeaderUseCase>(
      () => _i751.GetProductHeaderUseCase(gh<_i385.ProductDetailsRepo>()),
    );
    gh.factory<_i286.GetProductInventoryUseCase>(
      () => _i286.GetProductInventoryUseCase(gh<_i385.ProductDetailsRepo>()),
    );
    gh.factory<_i1048.GetProductPricingUseCase>(
      () => _i1048.GetProductPricingUseCase(gh<_i385.ProductDetailsRepo>()),
    );
    gh.factory<_i784.GetProductSalesHistoryUseCase>(
      () => _i784.GetProductSalesHistoryUseCase(gh<_i385.ProductDetailsRepo>()),
    );
    gh.factory<_i737.TopProductsRemoteDataSource>(
      () => _i169.TopProductsRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i1001.SummaryRemoteDataSource>(
      () => _i460.SummaryRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i404.RecentTransactionRemoteDataSource>(
      () => _i724.RecentTransactionRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i948.LowStockRemoteDataSource>(
      () => _i216.LowStockRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i400.TopSellingRemoteDataSource>(
      () => _i131.TopSellingRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i231.ReportsSalesRemoteDataSource>(
      () => _i324.ReportsSalesRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i629.ExportSalesReportUseCase>(
      () => _i629.ExportSalesReportUseCase(gh<_i578.ReportsExportRepository>()),
    );
    gh.factory<_i450.TodaySalesRepo>(
      () => _i835.TodaySalesRepoImpl(gh<_i29.TodaySalesRemoteDataSource>()),
    );
    gh.factory<_i896.ProductPricingCubit>(
      () => _i896.ProductPricingCubit(gh<_i1048.GetProductPricingUseCase>()),
    );
    gh.factory<_i281.HomeRepo>(
      () => _i101.HomeRepoImpl(
        gh<_i1001.SummaryRemoteDataSource>(),
        gh<_i878.SalesChartRemoteDataSource>(),
        gh<_i737.TopProductsRemoteDataSource>(),
        gh<_i948.LowStockRemoteDataSource>(),
      ),
    );
    gh.factory<_i480.ProductHeaderCubit>(
      () => _i480.ProductHeaderCubit(gh<_i751.GetProductHeaderUseCase>()),
    );
    gh.factory<_i3.InventorySummaryRepo>(
      () => _i623.InventorySummaryRepoImpl(
        gh<_i1051.InventorySummaryRemoteDataSource>(),
      ),
    );
    gh.factory<_i996.ProductActivityCubit>(
      () => _i996.ProductActivityCubit(gh<_i987.GetProductActivityUseCase>()),
    );
    gh.factory<_i438.QrCubit>(
      () => _i438.QrCubit(gh<_i528.QrUseCase>(), gh<_i295.SaveQrDataUseCase>()),
    );
    gh.factory<_i519.GetProfitSummaryUseCase>(
      () => _i519.GetProfitSummaryUseCase(gh<_i696.ProfitRepo>()),
    );
    gh.factory<_i473.GetProfitWeeklyChartUseCase>(
      () => _i473.GetProfitWeeklyChartUseCase(gh<_i696.ProfitRepo>()),
    );
    gh.factory<_i591.PurchasesRepo>(
      () => _i1021.PurchasesRepoImpl(gh<_i215.PurchasesRemoteDataSource>()),
    );
    gh.factory<_i911.GetTodayRecentTransactionUseCase>(
      () => _i911.GetTodayRecentTransactionUseCase(gh<_i450.TodaySalesRepo>()),
    );
    gh.factory<_i331.GetTodaySalesUseCase>(
      () => _i331.GetTodaySalesUseCase(gh<_i450.TodaySalesRepo>()),
    );
    gh.factory<_i714.ReportsExportCubit>(
      () => _i714.ReportsExportCubit(gh<_i629.ExportSalesReportUseCase>()),
    );
    gh.factory<_i88.ProductInventoryCubit>(
      () => _i88.ProductInventoryCubit(gh<_i286.GetProductInventoryUseCase>()),
    );
    gh.factory<_i753.ProductSalesHistoryCubit>(
      () => _i753.ProductSalesHistoryCubit(
        gh<_i784.GetProductSalesHistoryUseCase>(),
      ),
    );
    gh.factory<_i293.InventoryProudctUseCase>(
      () => _i293.InventoryProudctUseCase(gh<_i3.InventorySummaryRepo>()),
    );
    gh.factory<_i479.InventorySummaryUseCase>(
      () => _i479.InventorySummaryUseCase(gh<_i3.InventorySummaryRepo>()),
    );
    gh.factory<_i795.ReportsRepo>(
      () => _i298.ReportsRepoImpl(
        gh<_i400.TopSellingRemoteDataSource>(),
        gh<_i231.ReportsSalesRemoteDataSource>(),
        gh<_i404.RecentTransactionRemoteDataSource>(),
      ),
    );
    gh.factory<_i813.GetPurchasesRecentUseCase>(
      () => _i813.GetPurchasesRecentUseCase(gh<_i591.PurchasesRepo>()),
    );
    gh.factory<_i1023.GetPurchasesSummaryUseCase>(
      () => _i1023.GetPurchasesSummaryUseCase(gh<_i591.PurchasesRepo>()),
    );
    gh.factory<_i211.ProfitSummaryCubit>(
      () => _i211.ProfitSummaryCubit(gh<_i519.GetProfitSummaryUseCase>()),
    );
    gh.factory<_i389.TodaySalesCubit>(
      () => _i389.TodaySalesCubit(gh<_i331.GetTodaySalesUseCase>()),
    );
    gh.factory<_i290.LowStockUseCase>(
      () => _i290.LowStockUseCase(gh<_i281.HomeRepo>()),
    );
    gh.factory<_i1055.SalesChartUseCase>(
      () => _i1055.SalesChartUseCase(gh<_i281.HomeRepo>()),
    );
    gh.factory<_i267.SummaryUseCase>(
      () => _i267.SummaryUseCase(gh<_i281.HomeRepo>()),
    );
    gh.factory<_i134.TopProductsUseCase>(
      () => _i134.TopProductsUseCase(gh<_i281.HomeRepo>()),
    );
    gh.factory<_i429.ProfitWeeklyChartCubit>(
      () =>
          _i429.ProfitWeeklyChartCubit(gh<_i473.GetProfitWeeklyChartUseCase>()),
    );
    gh.factory<_i512.TodayRecentTransactionCubit>(
      () => _i512.TodayRecentTransactionCubit(
        gh<_i911.GetTodayRecentTransactionUseCase>(),
      ),
    );
    gh.factory<_i579.InventoryProductCubit>(
      () => _i579.InventoryProductCubit(gh<_i293.InventoryProudctUseCase>()),
    );
    gh.factory<_i58.PurchasesRecentCubit>(
      () => _i58.PurchasesRecentCubit(gh<_i813.GetPurchasesRecentUseCase>()),
    );
    gh.factory<_i956.InventoryCubit>(
      () => _i956.InventoryCubit(
        gh<_i479.InventorySummaryUseCase>(),
        gh<_i293.InventoryProudctUseCase>(),
      ),
    );
    gh.factory<_i1007.HomeCubit>(
      () => _i1007.HomeCubit(
        gh<_i267.SummaryUseCase>(),
        gh<_i1055.SalesChartUseCase>(),
        gh<_i134.TopProductsUseCase>(),
        gh<_i290.LowStockUseCase>(),
      ),
    );
    gh.factory<_i401.PurchasesSummaryCubit>(
      () =>
          _i401.PurchasesSummaryCubit(gh<_i1023.GetPurchasesSummaryUseCase>()),
    );
    gh.factory<_i489.RecentTransactionUseCase>(
      () => _i489.RecentTransactionUseCase(gh<_i795.ReportsRepo>()),
    );
    gh.factory<_i690.ReportsSalesUseCase>(
      () => _i690.ReportsSalesUseCase(gh<_i795.ReportsRepo>()),
    );
    gh.factory<_i203.TopSellingUseCase>(
      () => _i203.TopSellingUseCase(gh<_i795.ReportsRepo>()),
    );
    gh.factory<_i411.ReportsSalesCubit>(
      () => _i411.ReportsSalesCubit(gh<_i690.ReportsSalesUseCase>()),
    );
    gh.factory<_i288.RecentTransactionCubit>(
      () => _i288.RecentTransactionCubit(gh<_i489.RecentTransactionUseCase>()),
    );
    gh.factory<_i619.TopSellingCubit>(
      () => _i619.TopSellingCubit(gh<_i203.TopSellingUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i453.DioModule {}
