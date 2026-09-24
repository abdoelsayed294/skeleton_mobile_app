import 'package:skeleton_mobile_app/features/reports/data/models/recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';

extension RecentTransactionMapper on RecentTransactionDto {
  RecentTransactionEntity toEntity() {
    TransactionKind parsedKind = TransactionKind.cash;
    final lowercaseMethod = method.toLowerCase();

    if (lowercaseMethod.contains('card') ||
        lowercaseMethod.contains('visa') ||
        lowercaseMethod.contains('mastercard')) {
      parsedKind = TransactionKind.card;
    } else if (lowercaseMethod.contains('wallet') ||
        lowercaseMethod.contains('instapay') ||
        lowercaseMethod.contains('vodafone') ||
        lowercaseMethod.contains('fawry')) {
      parsedKind = TransactionKind.wallet;
    }

    return RecentTransactionEntity(
      orderId: orderNumber,
      time: time,
      paymentMethod: method,
      kind: parsedKind,
      amount: amount,
    );
  }
}
