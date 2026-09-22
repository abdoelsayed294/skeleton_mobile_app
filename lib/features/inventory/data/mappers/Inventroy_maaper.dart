import 'package:skeleton_mobile_app/features/inventory/data/model/inventory_summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/inventory/data/model/inventroy_product_response_dto.dart'
    as dto;
import 'package:skeleton_mobile_app/features/inventory/data/model/inventroy_product_response_dto.dart';

import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventory_summary_response.dart';
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart'
    as domain;
import 'package:skeleton_mobile_app/features/inventory/domain/entity/inventroy_product_response.dart' show InventroyProductResponse;

// =====================================================
// Inventory Summary Mapper
// =====================================================

extension InventorySummaryResponseDtoMapper
    on InventorySummaryResponseDto {
  InventorySummaryResponse toEntity() {
    return InventorySummaryResponse(
      totalProducts: totalProducts,
      lowStock: lowStock,
      outOfStock: outOfStock,
      itemTypes: itemTypes,
    );
  }
}

// =====================================================
// Inventory Products Response Mapper
// =====================================================

extension InventroyProductResponseDtoMapper
    on InventroyProductResponseDto {
  InventroyProductResponse toEntity() {
    return InventroyProductResponse(
      items: items
          ?.map((item) => item?.toEntity())
          .whereType<domain.Items>()
          .toList(),
      total: total,
      page: page,
      pageSize: pageSize,
    );
  }
}

// =====================================================
// Inventory Product Item Mapper
// =====================================================

extension ItemsDtoMapper on dto.Items { domain.Items toEntity() { return domain.Items( id: id, itemName: itemName, itemType: itemType, price1: price1, quantity: quantity, minStockLevel: minStockLevel, imageUrl: imageUrl, stockStatus: stockStatus, stockBadge: stockBadge, quantityValue: quantityValue, minStock: minStock, ); } }
