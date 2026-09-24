import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/features/reports/ui/widgets/stat_change_badge.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_cubit.dart';
import 'package:skeleton_mobile_app/features/today_sales/logic/today_sales_state.dart';

class TodayItemsSoldStatCard extends StatelessWidget {
  const TodayItemsSoldStatCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final accent = isDark ? AppColorsDark.success : AppColorsLight.success;

    return Expanded(
      child: Container(
        height: 116.h,
        padding: EdgeInsets.fromLTRB(13.w, 12.h, 13.w, 10.h),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: theme.dividerColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
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
                    l10n.itemsSold.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isDark
                        ? AppStyles.statTitleDark
                        : AppStyles.statTitleLight,
                  ),
                ),
                Icon(Icons.shopping_bag_outlined, size: 16.sp, color: accent),
              ],
            ),
            Expanded(
              child: BlocBuilder<TodaySalesCubit, TodaySalesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.itemsSold.toString(),
                          style: isDark
                              ? AppStyles.statValueDark
                              : AppStyles.statValueLight,
                        ),
                        Text(
                          '', // skus not available in entity, maybe omit or add to entity
                          style: isDark
                              ? AppStyles.statUnitDark
                              : AppStyles.statUnitLight,
                        ),
                        const Spacer(),
                        StatChangeBadge(
                          label:
                              '${data.itemsSoldChangePct >= 0 ? '+' : ''}${data.itemsSoldChangePct.toStringAsFixed(1)}%',
                          color: accent,
                        ),
                      ],
                    ),
                    orElse: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        ShimmerBlock(width: 54.w, height: 22.h),
                        const Spacer(),
                        ShimmerBlock(width: 45.w, height: 16.h, radius: 12),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
