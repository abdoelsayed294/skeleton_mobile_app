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
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i35.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i743.QrRemoteDataSources>(
      () => _i598.QrRemoteDataSourcesImpl(gh<_i35.ApiService>()),
    );
    gh.factory<_i571.QrRepo>(
      () => _i149.QrRepoImpl(gh<_i743.QrRemoteDataSources>()),
    );
    gh.factory<_i528.QrUseCase>(() => _i528.QrUseCase(gh<_i571.QrRepo>()));
    gh.factory<_i438.QrCubit>(() => _i438.QrCubit(gh<_i528.QrUseCase>()));
    return this;
  }
}

class _$DioModule extends _i453.DioModule {}
