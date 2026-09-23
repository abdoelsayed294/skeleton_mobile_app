import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';

class TodayRecentTransactionEntity {
  final String orderId;
  final String time;
  final String paymentMethod;
  final TransactionKind kind;
  final double amount;

  TodayRecentTransactionEntity({
    required this.orderId,
    required this.time,
    required this.paymentMethod,
    required this.kind,
    required this.amount,
  });
}
