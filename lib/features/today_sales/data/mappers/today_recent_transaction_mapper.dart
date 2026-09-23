import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';

extension TodayRecentTransactionMapper on TodayRecentTransactionDto {
  TodayRecentTransactionEntity toEntity() {
    TransactionKind parsedKind = TransactionKind.cash;
    final lowercaseMethod = paymentMethod.toLowerCase();
    
    if (lowercaseMethod.contains('card') || lowercaseMethod.contains('visa') || lowercaseMethod.contains('mastercard')) {
      parsedKind = TransactionKind.card;
    } else if (lowercaseMethod.contains('wallet') || lowercaseMethod.contains('instapay') || lowercaseMethod.contains('vodafone') || lowercaseMethod.contains('fawry')) {
      parsedKind = TransactionKind.wallet;
    }

    return TodayRecentTransactionEntity(
      orderId: orderNumber,
      time: time,
      paymentMethod: paymentMethod,
      kind: parsedKind,
      amount: total,
    );
  }
}
