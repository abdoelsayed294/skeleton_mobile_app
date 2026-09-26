import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_state.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_summary_metric.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_summary_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesSummaryCard extends StatelessWidget {
  const PurchasesSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();

    return BlocConsumer<PurchasesSummaryCubit, PurchasesSummaryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        loading: () => const PurchasesSummaryShimmer(),
        success: (data) => Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppColorsDark.primaryGradientStart,
                      AppColorsDark.primaryGradientEnd,
                    ]
                  : [
                      AppColorsLight.primaryGradientStart,
                      AppColorsLight.primary,
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22.r),
            border: Border.all(color: Colors.white.withValues(alpha: .22)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x121E88E5),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.totalPurchases,
                    style:
                        (isDark
                                ? AppStyles.statTitleDark
                                : AppStyles.statTitleLight)
                            .copyWith(
                              color: Colors.white.withValues(alpha: .82),
                            ),
                  ),
                  const Spacer(),
                  Container(
                    width: 34.w,
                    height: 34.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .14),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'EGP',
                    style:
                        (isDark
                                ? AppStyles.font12MediumDark
                                : AppStyles.font12MediumLight)
                            .copyWith(
                              color: Colors.white.withValues(alpha: .78),
                            ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    NumberFormat(
                      '#,##0.##',
                      locale,
                    ).format(data.totalPurchases),
                    style:
                        (isDark
                                ? AppStyles.font24BlackDark
                                : AppStyles.font24BlackLight)
                            .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14.sp,
                    color: Colors.white.withValues(alpha: .72),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    data.year == null || data.month == null
                        ? (data.monthLabel ?? l10n.thisMonth)
                        : DateFormat(
                            'MMM yyyy',
                            locale,
                          ).format(DateTime(data.year!, data.month!)),
                    style:
                        (isDark
                                ? AppStyles.font12MediumDark
                                : AppStyles.font12MediumLight)
                            .copyWith(
                              color: Colors.white.withValues(alpha: .78),
                            ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .22),
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(
                      '${data.vsLastMonthPct >= 0 ? '+' : ''}${NumberFormat('#,##0.##', locale).format(data.vsLastMonthPct)}% ${l10n.vsLastMonth.replaceAll(RegExp(r'^[+\-\s\d.,]+%?\s*'), '')}',
                      style:
                          (isDark
                                  ? AppStyles.statChangeDark
                                  : AppStyles.statChangeLight)
                              .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: PurchaseSummaryMetric(
                      title: l10n.ordersUpper,
                      value: data.orders.toString(),
                      subtitle: l10n.purchaseCount,
                      icon: Icons.receipt_long_outlined,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PurchaseSummaryMetric(
                      title: l10n.sourcesUpper,
                      value: data.suppliers.toString(),
                      subtitle: l10n.suppliers,
                      icon: Icons.inventory_2_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
