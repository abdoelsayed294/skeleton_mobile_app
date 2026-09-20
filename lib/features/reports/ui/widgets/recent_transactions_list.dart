import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/transaction_row.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class RecentTransactionsList extends StatelessWidget {
  const RecentTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final transactions = [
      ('#ORD-7821', '11:42 AM', l10n.paymentCash, TxnKind.cash, '285.50'),
      ('#ORD-7820', '11:17 AM', 'Visa Card', TxnKind.card, '1,120.00'),
      ('#ORD-7819', '10:54 AM', 'Vodafone Cash', TxnKind.wallet, '540.00'),
      ('#ORD-7818', '10:31 AM', l10n.paymentCash, TxnKind.cash, '87.00'),
      ('#ORD-7817', '9:58 AM', 'Mastercard', TxnKind.card, '2,340.75'),
      ('#ORD-7816', '9:22 AM', 'InstaPay', TxnKind.wallet, '675.25'),
    ];

    return SectionCard(
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.recentTransactions,
                    style: isDark
                        ? AppStyles.productTitleDark
                        : AppStyles.productTitleLight,
                  ),
                ),
                Text(
                  l10n.viewAll,
                  style: (isDark
                          ? AppStyles.productSubtitleDark
                          : AppStyles.productSubtitleLight)
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            ...List.generate(transactions.length, (index) {
              final txn = transactions[index];
              return TransactionRow(
                orderId: txn.$1,
                time: txn.$2,
                tag: txn.$3,
                kind: txn.$4,
                amount: txn.$5,
                isDark: isDark,
                isLast: index == transactions.length - 1,
              );
            }),
          ],
        ),
      ),
    );
  }
}

