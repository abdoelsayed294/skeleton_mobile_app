import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_handler.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/data/data_source/remote/summary_remote_data_source.dart';
import 'package:skeleton_mobile_app/features/home/data/mappers/summary_mapper.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/repo/summary_repo.dart';

@Injectable(as: SummaryRepo)
class SummaryRepoImpl extends SummaryRepo {
  final SummaryRemoteDataSource summaryRemoteDataSource;

  SummaryRepoImpl(this.summaryRemoteDataSource);

  @override
  Future<ApiResult<SummaryResponse>> getLowStock(int storeId, String date) async {
    final response = await summaryRemoteDataSource.getSummary(storeId, date);
    return response.when(
      success: (data) => ApiResult.success(data.toEntity()),
      failure: (error) => ApiResult.failure(ApiErrorHandler.handle(error)),
    );
  }
}