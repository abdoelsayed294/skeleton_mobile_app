import 'package:skeleton/features/reports/data/models/top_selling_dto.dart';
import 'package:skeleton/features/reports/domain/entities/top_selling_entity.dart';

extension TopSellingMapper on TopSellingDto {
  TopSellingEntity toEntity() {
    return TopSellingEntity(
      productName: itemName,
      unitsSold: unitsSold,
      revenue: revenue,
      changePct: changePct,
    );
  }
}
