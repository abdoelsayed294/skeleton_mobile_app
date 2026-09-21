import 'package:skeleton_mobile_app/features/home/data/models/low_stock_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/low_stock_response.dart';

extension DashboardLowStockResponseMapper on LowStockResponseDto {
  LowStockResponse toEntity() {
    return LowStockResponse(
      count: count,
      lowStockProducts: lowStockProducts?.map((product) => product.toEntity()).toList()
    );
  }
}

extension LowStockProductMapper on LowStockProductDto {
  LowStockProduct toEntity() {
    return LowStockProduct(
      productName: productName,
      quantity: quantity,
    );
  }
}
