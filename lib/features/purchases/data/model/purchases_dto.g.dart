// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasesSummaryDto _$PurchasesSummaryDtoFromJson(Map<String, dynamic> json) =>
    PurchasesSummaryDto(
      storeId: (json['storeId'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      monthLabel: json['monthLabel'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      totalPurchases: (json['totalPurchases'] as num?)?.toDouble(),
      vsLastMonthPct: (json['vsLastMonthPct'] as num?)?.toDouble(),
      vsLastMonthTotal: (json['vsLastMonthTotal'] as num?)?.toDouble(),
      orders: (json['orders'] as num?)?.toInt(),
      suppliers: (json['suppliers'] as num?)?.toInt(),
      recent: (json['recent'] as List<dynamic>?)
          ?.map((e) => PurchaseRecordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchasesSummaryDtoToJson(
  PurchasesSummaryDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'year': instance.year,
  'month': instance.month,
  'monthLabel': instance.monthLabel,
  'from': instance.from,
  'to': instance.to,
  'totalPurchases': instance.totalPurchases,
  'vsLastMonthPct': instance.vsLastMonthPct,
  'vsLastMonthTotal': instance.vsLastMonthTotal,
  'orders': instance.orders,
  'suppliers': instance.suppliers,
  'recent': instance.recent,
};

PurchasesRecentDto _$PurchasesRecentDtoFromJson(Map<String, dynamic> json) =>
    PurchasesRecentDto(
      storeId: (json['storeId'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      monthLabel: json['monthLabel'] as String?,
      count: (json['count'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PurchaseRecordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchasesRecentDtoToJson(PurchasesRecentDto instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'year': instance.year,
      'month': instance.month,
      'monthLabel': instance.monthLabel,
      'count': instance.count,
      'items': instance.items,
    };

PurchaseRecordDto _$PurchaseRecordDtoFromJson(Map<String, dynamic> json) =>
    PurchaseRecordDto(
      id: (json['id'] as num?)?.toInt(),
      supplier: json['supplier'] as String?,
      date: json['date'] as String?,
      monthLabel: json['monthLabel'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      status: json['status'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      paid: (json['paid'] as num?)?.toDouble(),
      remaining: (json['remaining'] as num?)?.toDouble(),
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$PurchaseRecordDtoToJson(PurchaseRecordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier': instance.supplier,
      'date': instance.date,
      'monthLabel': instance.monthLabel,
      'invoiceNumber': instance.invoiceNumber,
      'status': instance.status,
      'total': instance.total,
      'paid': instance.paid,
      'remaining': instance.remaining,
      'dueDate': instance.dueDate,
    };
