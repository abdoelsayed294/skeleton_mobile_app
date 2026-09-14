import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class PurchaseRecord {
  final String name, date, invoice, items, amount, status, initials;
  final Color color;
  final String? remaining, due;

  const PurchaseRecord({
    required this.name,
    required this.date,
    required this.invoice,
    required this.items,
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
    final statusColor = record.status == 'PAID'
        ? AppColorsLight.success
        : record.status == 'PARTIAL'
        ? AppColorsLight.warning
        : AppColorsLight.error;
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: AppColorsLight.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColorsLight.border),
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
                  style: AppStyles.font12MediumLight.copyWith(
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
                      style: AppStyles.font14MediumLight.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      record.date,
                      style: AppStyles.font12MediumLight.copyWith(
                        color: AppColorsLight.textMuted,
                      ),
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
            child: Divider(height: 1, color: AppColorsLight.borderLight),
          ),
          Row(
            children: [
              Text(record.invoice, style: AppStyles.font12MediumLight),
              Text(
                '  ·  ${record.items}',
                style: AppStyles.font12MediumLight.copyWith(
                  color: AppColorsLight.textMuted,
                ),
              ),
              const Spacer(),
              Text('EGP  ', style: AppStyles.font12MediumLight),
              Text(
                record.amount,
                style: AppStyles.statValueLight.copyWith(fontSize: 16),
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
                  style: AppStyles.font12MediumLight.copyWith(
                    color: record.due != null
                        ? AppColorsLight.error
                        : AppColorsLight.warning,
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
