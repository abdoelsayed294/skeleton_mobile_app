import 'package:skeleton_mobile_app/features/purchases/domain/entity/purchase_record.dart';

class PurchasesRecentEntity {
  final int? storeId;
  final int? year;
  final int? month;
  final String? monthLabel;
  final int count;
  final List<PurchaseRecordEntity> items;

  const PurchasesRecentEntity({
    this.storeId,
    this.year,
    this.month,
    this.monthLabel,
    required this.count,
    required this.items,
  });
}
