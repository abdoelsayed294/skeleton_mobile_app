import 'package:json_annotation/json_annotation.dart';

part 'purchases_dto.g.dart';

@JsonSerializable()
class PurchasesSummaryDto {
  @JsonKey(name: 'storeId')
  final int? storeId;
  @JsonKey(name: 'year')
  final int? year;
  @JsonKey(name: 'month')
  final int? month;
  @JsonKey(name: 'monthLabel')
  final String? monthLabel;
  @JsonKey(name: 'from')
  final String? from;
  @JsonKey(name: 'to')
  final String? to;
  @JsonKey(name: 'totalPurchases')
  final double? totalPurchases;
  @JsonKey(name: 'vsLastMonthPct')
  final double? vsLastMonthPct;
  @JsonKey(name: 'vsLastMonthTotal')
  final double? vsLastMonthTotal;
  @JsonKey(name: 'orders')
  final int? orders;
  @JsonKey(name: 'suppliers')
  final int? suppliers;
  @JsonKey(name: 'recent')
  final List<PurchaseRecordDto>? recent;

  const PurchasesSummaryDto({
    this.storeId,
    this.year,
    this.month,
    this.monthLabel,
    this.from,
    this.to,
    this.totalPurchases,
    this.vsLastMonthPct,
    this.vsLastMonthTotal,
    this.orders,
    this.suppliers,
    this.recent,
  });

  factory PurchasesSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$PurchasesSummaryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PurchasesSummaryDtoToJson(this);
}

@JsonSerializable()
class PurchasesRecentDto {
  @JsonKey(name: 'storeId')
  final int? storeId;
  @JsonKey(name: 'year')
  final int? year;
  @JsonKey(name: 'month')
  final int? month;
  @JsonKey(name: 'monthLabel')
  final String? monthLabel;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'items')
  final List<PurchaseRecordDto>? items;

  const PurchasesRecentDto({
    this.storeId,
    this.year,
    this.month,
    this.monthLabel,
    this.count,
    this.items,
  });

  factory PurchasesRecentDto.fromJson(Map<String, dynamic> json) =>
      _$PurchasesRecentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PurchasesRecentDtoToJson(this);
}

@JsonSerializable()
class PurchaseRecordDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'supplier')
  final String? supplier;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'monthLabel')
  final String? monthLabel;
  @JsonKey(name: 'invoiceNumber')
  final String? invoiceNumber;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'total')
  final double? total;
  @JsonKey(name: 'paid')
  final double? paid;
  @JsonKey(name: 'remaining')
  final double? remaining;
  @JsonKey(name: 'dueDate')
  final String? dueDate;

  const PurchaseRecordDto({
    this.id,
    this.supplier,
    this.date,
    this.monthLabel,
    this.invoiceNumber,
    this.status,
    this.total,
    this.paid,
    this.remaining,
    this.dueDate,
  });

  factory PurchaseRecordDto.fromJson(Map<String, dynamic> json) =>
      _$PurchaseRecordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseRecordDtoToJson(this);
}
