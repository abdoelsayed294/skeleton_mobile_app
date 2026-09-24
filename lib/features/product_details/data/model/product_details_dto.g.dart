// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductActivityDto _$ProductActivityDtoFromJson(Map<String, dynamic> json) =>
    ProductActivityDto(
      productId: (json['productId'] as num?)?.toInt(),
      itemName: json['itemName'] as String?,
      sold: (json['sold'] as num?)?.toInt(),
      purchased: (json['purchased'] as num?)?.toInt(),
      damaged: (json['damaged'] as num?)?.toInt(),
      salesReturn: (json['salesReturn'] as num?)?.toInt(),
      purchaseReturn: (json['purchaseReturn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductActivityDtoToJson(ProductActivityDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'itemName': instance.itemName,
      'sold': instance.sold,
      'purchased': instance.purchased,
      'damaged': instance.damaged,
      'salesReturn': instance.salesReturn,
      'purchaseReturn': instance.purchaseReturn,
    };

ProductHeaderDto _$ProductHeaderDtoFromJson(Map<String, dynamic> json) =>
    ProductHeaderDto(
      id: (json['id'] as num?)?.toInt(),
      itemName: json['itemName'] as String?,
      barcode: json['barcode'] as String?,
      itemType: json['itemType'] as String?,
      stockStatus: json['stockStatus'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductHeaderDtoToJson(ProductHeaderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'barcode': instance.barcode,
      'itemType': instance.itemType,
      'stockStatus': instance.stockStatus,
      'quantity': instance.quantity,
      'limit': instance.limit,
    };

ProductPricingDto _$ProductPricingDtoFromJson(Map<String, dynamic> json) =>
    ProductPricingDto(
      productId: (json['productId'] as num?)?.toInt(),
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      profitPerUnit: (json['profitPerUnit'] as num?)?.toDouble(),
      profitMargin: (json['profitMargin'] as num?)?.toDouble(),
      marginLabel: json['marginLabel'] as String?,
    );

Map<String, dynamic> _$ProductPricingDtoToJson(ProductPricingDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'purchasePrice': instance.purchasePrice,
      'sellingPrice': instance.sellingPrice,
      'profitPerUnit': instance.profitPerUnit,
      'profitMargin': instance.profitMargin,
      'marginLabel': instance.marginLabel,
    };

ProductInventoryDto _$ProductInventoryDtoFromJson(Map<String, dynamic> json) =>
    ProductInventoryDto(
      productId: (json['productId'] as num?)?.toInt(),
      currentStock: (json['currentStock'] as num?)?.toInt(),
      minimumStockLevel: (json['minimumStockLevel'] as num?)?.toInt(),
      unitsSoldToday: (json['unitsSoldToday'] as num?)?.toInt(),
      unitsSoldThisWeek: (json['unitsSoldThisWeek'] as num?)?.toInt(),
      unitsSoldThisMonth: (json['unitsSoldThisMonth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductInventoryDtoToJson(
  ProductInventoryDto instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'currentStock': instance.currentStock,
  'minimumStockLevel': instance.minimumStockLevel,
  'unitsSoldToday': instance.unitsSoldToday,
  'unitsSoldThisWeek': instance.unitsSoldThisWeek,
  'unitsSoldThisMonth': instance.unitsSoldThisMonth,
};

ProductSalesHistoryDto _$ProductSalesHistoryDtoFromJson(
  Map<String, dynamic> json,
) => ProductSalesHistoryDto(
  productId: (json['productId'] as num?)?.toInt(),
  period: json['period'] as String?,
  totalUnits: (json['totalUnits'] as num?)?.toInt(),
  changePct: (json['changePct'] as num?)?.toDouble(),
  vsLabel: json['vsLabel'] as String?,
  chart: (json['chart'] as List<dynamic>?)
      ?.map(
        (e) => ProductSalesHistoryPointDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ProductSalesHistoryDtoToJson(
  ProductSalesHistoryDto instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'period': instance.period,
  'totalUnits': instance.totalUnits,
  'changePct': instance.changePct,
  'vsLabel': instance.vsLabel,
  'chart': instance.chart,
};

ProductSalesHistoryPointDto _$ProductSalesHistoryPointDtoFromJson(
  Map<String, dynamic> json,
) => ProductSalesHistoryPointDto(
  label: json['label'] as String?,
  date: json['date'] as String?,
  units: (json['units'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductSalesHistoryPointDtoToJson(
  ProductSalesHistoryPointDto instance,
) => <String, dynamic>{
  'label': instance.label,
  'date': instance.date,
  'units': instance.units,
};
