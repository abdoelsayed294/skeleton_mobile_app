import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_style.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class AssistantHeader extends StatelessWidget {
  final VoidCallback onBack;
  const AssistantHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final bodyStyle = isDark
        ? AppStyles.assistantBodyDark
        : AppStyles.assistantBodyLight;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 8.h),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints.tightFor(
              width: isLandscape ? 32 : 32.w,
              height: isLandscape ? 32 : 32.h,
            ),
            icon: Icon(
              Icons.chevron_left_rounded,
              size: isLandscape ? 18 : 18.sp,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  l10n.aiAssistant,
                  style: isDark
                      ? AppStyles.assistantTitleDark
                      : AppStyles.assistantTitleLight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF059669),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(l10n.connectedToStore, style: bodyStyle),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune_rounded, size: 19.sp),
          ),
        ],
      ),
    );
  }
}
