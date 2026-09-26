import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/networking/api_result.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_sales_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/repo/today_sales_repo.dart';

@injectable
class GetTodaySalesUseCase {
  final TodaySalesRepo _todaySalesRepo;

  GetTodaySalesUseCase(this._todaySalesRepo);

  Future<ApiResult<TodaySalesEntity>> getTodaySales(
    int storeId,
    DateTime date,
  ) {
    return _todaySalesRepo.getTodaySales(storeId, date);
  }
}
