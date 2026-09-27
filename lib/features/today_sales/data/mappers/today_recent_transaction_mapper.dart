import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';
import 'package:skeleton_mobile_app/features/today_sales/data/models/today_recent_transaction_dto.dart';
import 'package:skeleton_mobile_app/features/today_sales/domain/entities/today_recent_transaction_entity.dart';

extension TodayRecentTransactionMapper on TodayRecentTransactionDto {
  TodayRecentTransactionEntity toEntity() {
    final note = notes ?? '';
    final normalizedNote = note.toLowerCase();
    var parsedKind = TransactionKind.cash;

    if (normalizedNote.contains('card') ||
        normalizedNote.contains('visa') ||
        normalizedNote.contains('mastercard')) {
      parsedKind = TransactionKind.card;
    } else if (normalizedNote.contains('wallet') ||
        normalizedNote.contains('instapay') ||
        normalizedNote.contains('vodafone') ||
        normalizedNote.contains('fawry')) {
      parsedKind = TransactionKind.wallet;
    }

    return TodayRecentTransactionEntity(
      orderId: name ?? itemName ?? '#$id',
      time: displayTime?.isNotEmpty == true ? displayTime! : time,
      paymentMethod: note,
      kind: parsedKind,
      amount: total,
    );
  }
}
