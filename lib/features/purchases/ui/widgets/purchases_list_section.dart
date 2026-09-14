import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_record_card.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_count_badge.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesListSection extends StatelessWidget {
  const PurchasesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    String purchaseDate(int day) =>
        DateFormat('MMM d, yyyy', locale).format(DateTime(2024, 11, day));
    String dueDate(int day) =>
        DateFormat('MMM d', locale).format(DateTime(2024, 11, day));
    final records = [
      PurchaseRecord(
        name: l10n.freshMarketSupplier,
        date: purchaseDate(18),
        invoice: '#INV-1048',
        items: l10n.itemsCount(24),
        amount: '4,250',
        status: l10n.paid,
        initials: 'FM',
        color: Color(0xFF2DD4BF),
      ),
      PurchaseRecord(
        name: l10n.alGhazalTrading,
        date: purchaseDate(16),
        invoice: '#INV-1045',
        items: l10n.itemsCount(36),
        amount: '7,800',
        status: l10n.partial,
        initials: 'AG',
        color: AppColorsLight.warningAlt,
        remaining: l10n.remainingAmount('EGP 3,200'),
      ),
      PurchaseRecord(
        name: l10n.nileFoodsDistribution,
        date: purchaseDate(14),
        invoice: '#INV-1041',
        items: l10n.itemsCount(18),
        amount: '5,600',
        status: l10n.paid,
        initials: 'NF',
        color: Color(0xFF38BDF8),
      ),
      PurchaseRecord(
        name: l10n.deltaExpressWholesale,
        date: purchaseDate(12),
        invoice: '#INV-1039',
        items: l10n.itemsCount(52),
        amount: '9,100',
        status: l10n.pending,
        initials: 'DE',
        color: AppColorsLight.errorAlt,
        due: l10n.dueDate(dueDate(20)),
      ),
      PurchaseRecord(
        name: l10n.kareemGeneralImports,
        date: purchaseDate(10),
        invoice: '#INV-1034',
        items: l10n.itemsCount(11),
        amount: '2,350',
        status: l10n.paid,
        initials: 'KG',
        color: AppColorsLight.primary,
      ),
      PurchaseRecord(
        name: l10n.medPharmaSupplies,
        date: purchaseDate(8),
        invoice: '#INV-1029',
        items: l10n.itemsCount(29),
        amount: '3,350',
        status: l10n.partial,
        initials: 'MP',
        color: AppColorsLight.warningAlt,
        remaining: l10n.remainingAmount('EGP 1,100'),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.recentPurchases,
              style: isDark
                  ? AppStyles.statTitleDark
                  : AppStyles.statTitleLight,
            ),
            SizedBox(width: 8.w),
            const PurchasesCountBadge(),
            const Spacer(),
            Text(
              l10n.seeAll,
              style:
                  (isDark
                          ? AppStyles.font12MediumDark
                          : AppStyles.font12MediumLight)
                      .copyWith(
                        color: isDark
                            ? AppColorsDark.primary
                            : AppColorsLight.primary,
                        fontWeight: FontWeight.w700,
                      ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ...records.map(
          (record) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: PurchaseRecordCard(record: record),
          ),
        ),
      ],
    );
  }
}
