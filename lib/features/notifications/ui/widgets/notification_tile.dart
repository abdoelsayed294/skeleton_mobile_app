import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color accent;
  final String title;
  final String body;
  final String time;
  final List<String> tags;
  final bool unread;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.accent,
    required this.title,
    required this.body,
    required this.time,
    this.tags = const [],
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = isDark ? AppColorsDark.surface : AppColorsLight.surface;
    final border = isDark ? AppColorsDark.border : AppColorsLight.border;
    final titleStyle = isDark
        ? AppStyles.font14MediumDark
        : AppStyles.font14MediumLight;
    final bodyStyle = isDark
        ? AppStyles.font12MediumDark
        : AppStyles.font12MediumLight;
    final text = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: unread ? accent.withValues(alpha: 0.65) : border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: isDark ? 0.18 : 0.14),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: accent, size: 22.sp),
              ),
              if (unread)
                Positioned(
                  right: -2.w,
                  top: -2.h,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: surface, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(time, style: bodyStyle.copyWith(fontSize: 10.sp)),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  body,
                  style: bodyStyle.copyWith(fontSize: 11.sp, height: 1.35),
                ),
                if (tags.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 5.h,
                    children: tags.asMap().entries.map((entry) {
                      final isAction = entry.key == 1 && unread;
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: isAction
                              ? Colors.transparent
                              : accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                        child: Text(
                          isAction ? '${entry.value} ->' : entry.value,
                          style: bodyStyle.copyWith(
                            color: isAction ? accent : text,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
