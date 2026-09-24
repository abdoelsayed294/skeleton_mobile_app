import 'package:skeleton_mobile_app/features/home/data/models/top_products_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';

extension DashboardTopProductsMapper on TopProductDto {
  TopProductEntity toEntity() {
    return TopProductEntity(
      id: id ?? 0,
      productName: itemName ?? '',
      itemType: itemType ?? '',
      quantity: quantity ?? 0,
      purchasePrice: priceBuy ?? 0,
      sellingPrice: price1 ?? 0,
      barcode: barcode ?? '',
      limit: limit ?? 0,
      sold: sell ?? 0,
      storeId: storeId ?? 0,
    );
  }
}
