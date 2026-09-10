import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class StockItem extends StatelessWidget {
  final String name;
  final int count;
  final double progress;
  final bool warning;
  final bool isDark;
  final AppLocalizations l10n;

  const StockItem({
    super.key,
    required this.name,
    required this.count,
    required this.progress,
    required this.warning,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final color = warning
        ? (isDark ? AppColorsDark.error : AppColorsLight.error)
        : (isDark ? AppColorsDark.warningAlt : AppColorsLight.warningAlt);
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 9.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: isDark
                      ? AppStyles.stockItemDark
                      : AppStyles.stockItemLight,
                ),
              ),
              Icon(
                warning
                    ? Icons.warning_amber_rounded
                    : Icons.error_outline_rounded,
                size: 13.sp,
                color: color,
              ),
              SizedBox(width: 3.w),
              Text(
                '$count ${l10n.left}',
                style:
                    (isDark
                            ? AppStyles.stockStatusDark
                            : AppStyles.stockStatusLight)
                        .copyWith(color: color),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5.h,
              backgroundColor: color.withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}
