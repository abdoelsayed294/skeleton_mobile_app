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
    as _i215;
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
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source.dart'
    as _i404;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/recent_transaction_remote_data_source_impl.dart'
    as _i724;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source.dart'
    as _i231;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/reports_sales_remote_data_source_impl.dart'
    as _i324;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source.dart'
    as _i400;
import 'package:skeleton_mobile_app/features/reports/data/data_source/remote/top_selling_remote_data_source_impl.dart'
    as _i131;
import 'package:skeleton_mobile_app/features/reports/data/repo/reports_repo_impl.dart'
    as _i298;
import 'package:skeleton_mobile_app/features/reports/domain/repo/reports_repo.dart'
    as _i795;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/recent_transaction_use_case.dart'
    as _i489;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/reports_sales_use_case.dart'
    as _i690;
import 'package:skeleton_mobile_app/features/reports/domain/use_cases/top_selling_use_case.dart'
    as _i203;
import 'package:skeleton_mobile_app/features/reports/logic/recent_transaction_cubit.dart'
    as _i288;
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
    gh.lazySingleton<_i35.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i878.SalesChartRemoteDataSource>(
      () => _i500.SalesChartRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i743.QrRemoteDataSources>(
      () => _i598.QrRemoteDataSourcesImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i571.QrRepo>(
      () => _i149.QrRepoImpl(gh<_i743.QrRemoteDataSources>()),
    );
    gh.factory<_i528.QrUseCase>(() => _i528.QrUseCase(gh<_i571.QrRepo>()));
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
      () => _i215.LowStockRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i400.TopSellingRemoteDataSource>(
      () => _i131.TopSellingRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i231.ReportsSalesRemoteDataSource>(
      () => _i324.ReportsSalesRemoteDataSourceImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i281.HomeRepo>(
      () => _i101.HomeRepoImpl(
        gh<_i1001.SummaryRemoteDataSource>(),
        gh<_i878.SalesChartRemoteDataSource>(),
        gh<_i737.TopProductsRemoteDataSource>(),
        gh<_i948.LowStockRemoteDataSource>(),
      ),
    );
    gh.factory<_i438.QrCubit>(
      () => _i438.QrCubit(gh<_i528.QrUseCase>(), gh<_i295.SaveQrDataUseCase>()),
    );
    gh.factory<_i795.ReportsRepo>(
      () => _i298.ReportsRepoImpl(
        gh<_i400.TopSellingRemoteDataSource>(),
        gh<_i231.ReportsSalesRemoteDataSource>(),
        gh<_i404.RecentTransactionRemoteDataSource>(),
      ),
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
    gh.factory<_i1007.HomeCubit>(
      () => _i1007.HomeCubit(
        gh<_i267.SummaryUseCase>(),
        gh<_i1055.SalesChartUseCase>(),
        gh<_i134.TopProductsUseCase>(),
        gh<_i290.LowStockUseCase>(),
      ),
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
