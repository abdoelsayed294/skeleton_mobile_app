import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ScanInstructionItem extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final IconData icon;
  final bool showDivider;

  const ScanInstructionItem({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                '$number',
                style: (isDark ? AppStyles.txnTagDark : AppStyles.txnTagLight)
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(width: 9.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: (isDark ? AppStyles.txnIdDark : AppStyles.txnIdLight)
                        .copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    description,
                    style: isDark
                        ? AppStyles.txnMetaDark.copyWith(fontSize: 12.sp)
                        : AppStyles.txnMetaLight.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Icon(icon, size: 15.sp, color: Theme.of(context).primaryColor),
          ],
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.only(left: 34.w, top: 11.h, bottom: 11.h),
            child: Divider(height: 1, color: Theme.of(context).dividerColor),
          ),
      ],
    );
  }
}
