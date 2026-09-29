import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/features/expeness/ui/widgets/expense_transaction.dart';
import 'package:skeleton/features/expeness/ui/widgets/expense_transaction_row.dart';
import 'package:skeleton/l10n/app_localizations.dart';

/// "All Transactions" card: header with the record count + a "Latest"
/// sort badge, followed by a divided list of transaction rows.
class AllTransactionsCard extends StatelessWidget {
  const AllTransactionsCard({
    super.key,
    required this.transactions,
    this.onSortTap,
    this.onLoadMore,
    this.hasMore = false,
    this.isLoadingMore = false,
    this.sortLabel,
  });

  final List<ExpenseTransaction> transactions;
  final VoidCallback? onSortTap;
  final VoidCallback? onLoadMore;
  final bool hasMore;
  final bool isLoadingMore;
  final String? sortLabel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColorsDark.surface : AppColorsLight.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isDark ? AppColorsDark.border : AppColorsLight.border,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.allTransactions,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColorsDark.textPrimary
                            : AppColorsLight.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      l10n.recordsCount(transactions.length),
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColorsDark.textSecondary
                            : AppColorsLight.textSecondary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColorsDark.border
                            : AppColorsLight.infoBg,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        sortLabel ?? l10n.latest,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: isDark
                              ? AppColorsDark.primary
                              : AppColorsLight.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: onSortTap,
                      borderRadius: BorderRadius.circular(14.r),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Icon(
                          Icons.swap_vert_rounded,
                          size: 20.sp,
                          color: isDark
                              ? AppColorsDark.textSecondary
                              : AppColorsLight.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          for (final transaction in transactions)
            ExpenseTransactionRow(
              transaction: transaction,
              showDivider: transaction != transactions.last,
            ),
          if (hasMore)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: TextButton(
                  onPressed: isLoadingMore ? null : onLoadMore,
                  child: isLoadingMore
                      ? SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Text(l10n.loadMore),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
