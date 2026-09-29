import 'package:skeleton/core/networking/api_result.dart';
import 'package:skeleton/features/reports/data/models/top_selling_dto.dart';

abstract class TopSellingRemoteDataSource {
  Future<ApiResult<List<TopSellingDto>>> getTopSelling(
    int storeId,
    String period,
    int take,
    int year,
    int month,
  );
}
