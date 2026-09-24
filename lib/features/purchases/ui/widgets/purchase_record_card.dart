import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchaseRecord {
  final String name, date, invoice, amount, status, initials;
  final String? items;
  final Color color;
  final String? remaining, due;

  const PurchaseRecord({
    required this.name,
    required this.date,
    required this.invoice,
    this.items,
    required this.amount,
    required this.status,
    required this.initials,
    required this.color,
    this.remaining,
    this.due,
  });
}

class PurchaseRecordCard extends StatelessWidget {
  final PurchaseRecord record;

  const PurchaseRecordCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final primaryText = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final mutedText = isDark
        ? AppColorsDark.textMuted
        : AppColorsLight.textMuted;
    final statusColor = record.status == l10n.paid
        ? (isDark ? AppColorsDark.success : AppColorsLight.success)
        : record.status == l10n.partial
        ? (isDark ? AppColorsDark.warning : AppColorsLight.warning)
        : (isDark ? AppColorsDark.error : AppColorsLight.error);
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A1E88E5),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: record.color.withValues(alpha: .08),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: record.color.withValues(alpha: .55),
                  ),
                ),
                child: Text(
                  record.initials,
                  style:
                      (isDark
                              ? AppStyles.font12MediumDark
                              : AppStyles.font12MediumLight)
                          .copyWith(
                            color: record.color,
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          (isDark
                                  ? AppStyles.font14MediumDark
                                  : AppStyles.font14MediumLight)
                              .copyWith(
                                color: primaryText,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      record.date,
                      style:
                          (isDark
                                  ? AppStyles.font12MediumDark
                                  : AppStyles.font12MediumLight)
                              .copyWith(color: mutedText),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: .08),
                  border: Border.all(color: statusColor.withValues(alpha: .35)),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  record.status,
                  style: AppStyles.statChangeLight.copyWith(
                    color: statusColor,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(height: 1, color: border),
          ),
          Row(
            children: [
              Text(
                record.invoice,
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              Text(
                record.items == null ? '' : ' · ${record.items}',
                style:
                    (isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight)
                        .copyWith(color: mutedText),
              ),
              const Spacer(),
              Text(
                'EGP  ',
                style: isDark
                    ? AppStyles.font12MediumDark
                    : AppStyles.font12MediumLight,
              ),
              Text(
                record.amount,
                style:
                    (isDark
                            ? AppStyles.statValueDark
                            : AppStyles.statValueLight)
                        .copyWith(fontSize: 16),
              ),
            ],
          ),
          if (record.remaining != null || record.due != null)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  record.remaining ?? record.due!,
                  style:
                      (isDark
                              ? AppStyles.font12MediumDark
                              : AppStyles.font12MediumLight)
                          .copyWith(
                            color: record.due != null
                                ? (isDark
                                      ? AppColorsDark.error
                                      : AppColorsLight.error)
                                : (isDark
                                      ? AppColorsDark.warning
                                      : AppColorsLight.warning),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
