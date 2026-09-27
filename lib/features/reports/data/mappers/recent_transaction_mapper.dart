import 'package:skeleton_mobile_app/features/reports/data/models/recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';

extension RecentTransactionMapper on RecentTransactionDto {
  RecentTransactionEntity toEntity() {
    final label = notes ?? customer ?? item ?? '';
    final normalizedLabel = label.toLowerCase();
    var parsedKind = TransactionKind.cash;

    if (normalizedLabel.contains('card') ||
        normalizedLabel.contains('visa') ||
        normalizedLabel.contains('mastercard')) {
      parsedKind = TransactionKind.card;
    } else if (normalizedLabel.contains('wallet') ||
        normalizedLabel.contains('instapay') ||
        normalizedLabel.contains('vodafone') ||
        normalizedLabel.contains('fawry')) {
      parsedKind = TransactionKind.wallet;
    }

    return RecentTransactionEntity(
      orderId: orderNumber,
      time: time,
      paymentMethod: label,
      kind: parsedKind,
      amount: amount,
    );
  }
}
