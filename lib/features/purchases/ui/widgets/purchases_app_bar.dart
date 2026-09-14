import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_header_icon.dart';

class PurchasesAppBar extends StatelessWidget {
  const PurchasesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Purchases', style: AppStyles.font24BlackLight),
            const Spacer(),
            const PurchasesHeaderIcon(icon: Icons.fullscreen_rounded),
            SizedBox(width: 10.w),
            const PurchasesHeaderIcon(
              icon: Icons.person_outline_rounded,
              isProfile: true,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: AppColorsLight.surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColorsLight.border),
            boxShadow: const [
              BoxShadow(color: Color(0x0D1E88E5), blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14.sp,
                color: AppColorsLight.primary,
              ),
              SizedBox(width: 8.w),
              Text(
                'Nov 2024',
                style: AppStyles.font12MediumLight.copyWith(
                  color: AppColorsLight.textPrimary,
                ),
              ),
              SizedBox(width: 12.w),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 17.sp,
                color: AppColorsLight.textMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
