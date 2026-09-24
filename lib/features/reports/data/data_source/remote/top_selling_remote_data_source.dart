import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/reports/data/models/top_selling_dto.dart';

abstract class TopSellingRemoteDataSource {
  Future<ApiResult<List<TopSellingDto>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  );
}
