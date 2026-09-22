// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryResponseDto _$SummaryResponseDtoFromJson(Map<String, dynamic> json) =>
    SummaryResponseDto(
      date: DateTime.parse(json['date'] as String),
      storeId: (json['storeId'] as num).toInt(),
      businessSummary: BusinessSummaryDto.fromJson(
        json['business'] as Map<String, dynamic>,
      ),
      storeSummary: StoreSummaryDto.fromJson(
        json['store'] as Map<String, dynamic>,
      ),
      todaySales: (json['todaySales'] as num).toDouble(),
      salesChangePct: (json['salesChangePct'] as num).toDouble(),
      todayExpenses: (json['todayExpenses'] as num).toDouble(),
      expensesChangePct: (json['expensesChangePct'] as num).toDouble(),
      todayPurchases: (json['todayPurchases'] as num).toDouble(),
      purchasesChangePct: (json['purchasesChangePct'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
      netProfitChangePct: (json['netProfitChangePct'] as num).toDouble(),
      cogs: (json['cogs'] as num).toInt(),
      totalProducts: (json['totalProducts'] as num).toInt(),
    );

Map<String, dynamic> _$SummaryResponseDtoToJson(SummaryResponseDto instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'storeId': instance.storeId,
      'business': instance.businessSummary,
      'store': instance.storeSummary,
      'todaySales': instance.todaySales,
      'salesChangePct': instance.salesChangePct,
      'todayExpenses': instance.todayExpenses,
      'expensesChangePct': instance.expensesChangePct,
      'todayPurchases': instance.todayPurchases,
      'purchasesChangePct': instance.purchasesChangePct,
      'netProfit': instance.netProfit,
      'netProfitChangePct': instance.netProfitChangePct,
      'cogs': instance.cogs,
      'totalProducts': instance.totalProducts,
    };

BusinessSummaryDto _$BusinessSummaryDtoFromJson(Map<String, dynamic> json) =>
    BusinessSummaryDto(
      id: (json['id'] as num).toInt(),
      businessName: json['name'] as String,
      ownerName: json['ownerName'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$BusinessSummaryDtoToJson(BusinessSummaryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.businessName,
      'ownerName': instance.ownerName,
      'phone': instance.phone,
      'address': instance.address,
    };

StoreSummaryDto _$StoreSummaryDtoFromJson(Map<String, dynamic> json) =>
    StoreSummaryDto(
      id: (json['id'] as num).toInt(),
      storeName: json['storeName'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      businessId: (json['businessID'] as num).toInt(),
    );

Map<String, dynamic> _$StoreSummaryDtoToJson(StoreSummaryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeName': instance.storeName,
      'address': instance.address,
      'phone': instance.phone,
      'businessID': instance.businessId,
    };
