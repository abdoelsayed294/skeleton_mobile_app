import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class AddPurchaseButton extends StatelessWidget {
  const AddPurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColorsLight.primary,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        icon: const Icon(Icons.add_rounded, color: AppColorsLight.surface),
        label: Text(
          'Add Purchase',
          style: AppStyles.font14MediumLight.copyWith(
            color: AppColorsLight.surface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
