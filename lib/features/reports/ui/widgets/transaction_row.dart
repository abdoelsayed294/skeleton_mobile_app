import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';


import 'package:skeleton_mobile_app/features/reports/domain/entities/recent_transaction_entity.dart';

class TransactionRow extends StatelessWidget {
  final String orderId;
  final String time;
  final String tag;
  final TransactionKind kind;
  final String amount;
  final bool isDark;
  final bool isLast;

  const TransactionRow({
    required this.orderId,
    required this.time,
    required this.tag,
    required this.kind,
    required this.amount,
    required this.isDark,
    required this.isLast,
  });

  Color get _tagColor {
    switch (kind) {
      case TransactionKind.cash:
        return isDark ? AppColorsDark.textSecondary : AppColorsLight.textSecondary;
      case TransactionKind.card:
        return isDark ? AppColorsDark.accentOrange : AppColorsLight.accentOrange;
      case TransactionKind.wallet:
        return isDark ? AppColorsDark.accentGreen : AppColorsLight.accentGreen;
    }
  }

  IconData get _icon {
    switch (kind) {
      case TransactionKind.cash:
        return Icons.receipt_long_outlined;
      case TransactionKind.card:
        return Icons.credit_card_rounded;
      case TransactionKind.wallet:
        return Icons.phone_iphone_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final color = _tagColor;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.dividerColor.withValues(alpha: 0.45),
                ),
              ),
            ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Icon(_icon, size: 16.sp, color: color),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderId,
                  style: isDark ? AppStyles.txnIdDark : AppStyles.txnIdLight,
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      time,
                      style: isDark
                          ? AppStyles.txnMetaDark
                          : AppStyles.txnMetaLight,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '•',
                      style: isDark
                          ? AppStyles.txnMetaDark
                          : AppStyles.txnMetaLight,
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        tag,
                        style:
                            (isDark
                                    ? AppStyles.txnTagDark
                                    : AppStyles.txnTagLight)
                                .copyWith(color: color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '${l10n.currencyEgp} $amount',
            style: isDark ? AppStyles.txnAmountDark : AppStyles.txnAmountLight,
          ),
        ],
      ),
    );
  }
}
