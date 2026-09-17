import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class StatsGrid extends StatefulWidget {
  const StatsGrid({super.key});

  @override
  State<StatsGrid> createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: l10n.todaySales.toUpperCase(),
                value: '12,450',
                unit: 'EGP',
                change: '+12.5%',
                icon: Icons.shopping_bag_outlined,
                isSelected: selectedCardIndex == 0,
                onTap: () {
                  setState(() => selectedCardIndex = 0);
                  Navigator.of(context).pushNamed(Routes.todaySalesScreen);
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                title: l10n.todayOrders.toUpperCase(),
                value: '247',
                unit: l10n.orders,
                change: '+8.2%',
                icon: Icons.shopping_bag_outlined,
                isSelected: selectedCardIndex == 1,
                onTap: () => setState(() => selectedCardIndex = 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: l10n.purchases.toUpperCase(),
                value: '5,828',
                unit: 'EGP',
                change: '-3.1%',
                icon: Icons.shopping_bag_outlined,
                isNegative: true,
                isSelected: selectedCardIndex == 2,
                onTap: () {
                  setState(() => selectedCardIndex = 2);
                  Navigator.of(context).pushNamed(Routes.purchasesScreen);
                },
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: StatCard(
                title: l10n.netProfit.toUpperCase(),
                value: '4,630',
                unit: 'EGP',
                change: '+18.7%',
                icon: Icons.attach_money_rounded,
                accentColor: const Color(0xFF059669),
                isSelected: selectedCardIndex == 3,
                onTap: () {
                  setState(() => selectedCardIndex = 3);
                  Navigator.of(context).pushNamed(Routes.profitDetailsScreen);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String change;
  final IconData icon;
  final Color? accentColor;
  final bool isNegative;
  final bool isSelected;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.change,
    required this.icon,
    this.accentColor,
    this.isNegative = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = isSelected
        ? theme.primaryColor
        : accentColor ?? theme.textTheme.bodyLarge?.color;
    final changeColor = isNegative
        ? (isDark ? AppColorsDark.error : AppColorsLight.error)
        : (isDark ? AppColorsDark.success : AppColorsLight.success);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 128.h,
        padding: EdgeInsets.fromLTRB(13.w, 12.h, 13.w, 10.h),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor.withOpacity(0.45)
                : accentColor == null
                ? theme.dividerColor
                : accent!.withOpacity(0.25),
            width: isSelected ? 1.5.w : 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        (isDark
                                ? AppStyles.statTitleDark
                                : AppStyles.statTitleLight)
                            .copyWith(
                              color: isSelected ? theme.primaryColor : null,
                            ),
                  ),
                ),
                Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    color: (accent ?? theme.primaryColor).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: (accent ?? theme.primaryColor).withOpacity(0.18),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 15.sp,
                    color: accent ?? theme.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style:
                  (isDark ? AppStyles.statValueDark : AppStyles.statValueLight)
                      .copyWith(color: accent),
            ),
            Text(
              unit,
              style: isDark ? AppStyles.statUnitDark : AppStyles.statUnitLight,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: changeColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: changeColor.withOpacity(0.35)),
              ),
              child: Text(
                '${isNegative ? '↘' : '↗'} $change',
                style:
                    (isDark
                            ? AppStyles.statChangeDark
                            : AppStyles.statChangeLight)
                        .copyWith(color: changeColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
