import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProductEditButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProductEditButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColorsDark.primary
        : AppColorsLight.primary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        elevation: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.edit_outlined, size: 16.sp, color: Colors.white),
          SizedBox(width: 8.w),
          Text(
            'Edit Product',
            style:
                (isDark ? AppStyles.font16BoldDark : AppStyles.font16BoldLight)
                    .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
