import 'package:skeleton_mobile_app/features/purchases/data/model/purchases_dto.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchase_record.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_recent.dart';
import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchases_summary.dart';

extension PurchaseRecordDtoMapper on PurchaseRecordDto {
  PurchaseRecordEntity toEntity() => PurchaseRecordEntity(
    id: id ?? 0,
    supplier: supplier,
    date: DateTime.tryParse(date ?? ''),
    monthLabel: monthLabel,
    invoiceNumber: invoiceNumber,
    status: status,
    total: total ?? 0,
    paid: paid ?? 0,
    remaining: remaining ?? 0,
    dueDate: DateTime.tryParse(dueDate ?? ''),
  );
}

extension PurchasesSummaryDtoMapper on PurchasesSummaryDto {
  PurchasesSummaryEntity toEntity() => PurchasesSummaryEntity(
    storeId: storeId,
    year: year,
    month: month,
    monthLabel: monthLabel,
    from: DateTime.tryParse(from ?? ''),
    to: DateTime.tryParse(to ?? ''),
    totalPurchases: totalPurchases ?? 0,
    vsLastMonthPct: vsLastMonthPct ?? 0,
    vsLastMonthTotal: vsLastMonthTotal ?? 0,
    orders: orders ?? 0,
    suppliers: suppliers ?? 0,
  );
}

extension PurchasesRecentDtoMapper on PurchasesRecentDto {
  PurchasesRecentEntity toEntity() => PurchasesRecentEntity(
    storeId: storeId,
    year: year,
    month: month,
    monthLabel: monthLabel,
    count: count ?? items?.length ?? 0,
    items: items?.map((item) => item.toEntity()).toList() ?? const [],
  );
}
