import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class ProductEditButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ProductEditButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          elevation: 3,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.edit_outlined, size: 16.sp, color: isDark ? Colors.black : Colors.white),
            SizedBox(width: 8.w),
            Text(
              'Edit Product',
              style: (isDark ? AppStyles.font16BoldDark : AppStyles.font16BoldLight).copyWith(
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
