import 'package:skeleton_mobile_app/features/product_details/data/model/product_details_dto.dart';
import 'package:skeleton_mobile_app/features/product_details/domain/entity/product_details_entities.dart';

extension ProductActivityDtoMapper on ProductActivityDto {
  ProductActivityEntity toEntity() => ProductActivityEntity(
    productId: productId ?? 0,
    itemName: itemName ?? '',
    sold: sold ?? 0,
    purchased: purchased ?? 0,
    damaged: damaged ?? 0,
    salesReturn: salesReturn ?? 0,
    purchaseReturn: purchaseReturn ?? 0,
  );
}

extension ProductHeaderDtoMapper on ProductHeaderDto {
  ProductHeaderEntity toEntity() => ProductHeaderEntity(
    id: id ?? 0,
    itemName: itemName ?? '',
    barcode: barcode ?? '',
    itemType: itemType ?? '',
    stockStatus: stockStatus ?? '',
    quantity: quantity ?? 0,
    limit: limit ?? 0,
  );
}

extension ProductPricingDtoMapper on ProductPricingDto {
  ProductPricingEntity toEntity() => ProductPricingEntity(
    productId: productId ?? 0,
    purchasePrice: purchasePrice ?? 0,
    sellingPrice: sellingPrice ?? 0,
    profitPerUnit: profitPerUnit ?? 0,
    profitMargin: profitMargin ?? 0,
    marginLabel: marginLabel ?? '',
  );
}

extension ProductInventoryDtoMapper on ProductInventoryDto {
  ProductInventoryEntity toEntity() => ProductInventoryEntity(
    productId: productId ?? 0,
    currentStock: currentStock ?? 0,
    minimumStockLevel: minimumStockLevel ?? 0,
    unitsSoldToday: unitsSoldToday ?? 0,
    unitsSoldThisWeek: unitsSoldThisWeek ?? 0,
    unitsSoldThisMonth: unitsSoldThisMonth ?? 0,
  );
}

extension ProductSalesHistoryDtoMapper on ProductSalesHistoryDto {
  ProductSalesHistoryEntity toEntity() => ProductSalesHistoryEntity(
    productId: productId ?? 0,
    period: period ?? 'week',
    totalUnits: totalUnits ?? 0,
    changePct: changePct ?? 0,
    vsLabel: vsLabel ?? '',
    chart:
        chart
            ?.map(
              (point) => ProductSalesHistoryPointEntity(
                label: point.label ?? '',
                date: point.date ?? '',
                units: point.units ?? 0,
              ),
            )
            .toList() ??
        const [],
  );
}
