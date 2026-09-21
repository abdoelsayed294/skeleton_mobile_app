import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';

abstract class SummaryRepo {
  Future<ApiResult<SummaryResponse>> getLowStock(int storeId, String date);
}