import 'package:skeleton_mobile_app/features/home/data/models/top_products_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';

extension DashboardTopProductsMapper on TopProductDto {
  TopProductEntity toEntity() {
    return TopProductEntity(
      productName: productName,
      quantitySold: quantitySold,
      totalValue: totalValue,
    );
  }
}
